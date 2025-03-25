open Memory
open Ast
open Common

exception TraceError of trace_error

type state = Memory.env_stack * Memory.memory
type conf = St | Ret of int | Instr of Ast.instruction

let int_of_bool = function
  | true -> 1
  | false -> 0

let bool_of_int = function
  | 0 -> false
  | _ -> true

let call_args_reduced args =
  List.fold_left
    (fun acc arg ->
      acc
      &&
      match arg with
      | CONST _ -> true
      | STR _ -> true
      | _ -> false)
    true args

let rec get_free_mem_loc memory =
  let random_loc = Random.int 1073741823 in
  match Hashtbl.find_opt memory random_loc with
  | None -> random_loc
  | Some _ -> get_free_mem_loc memory

let rec reduce_arg (env_stack, memory) expr =
  match expr with
  | IDE id -> (
      let v = trace1_expr (env_stack, memory) expr in
      match v with
      | STR _ -> (
          let env = Stack.top env_stack in
          match Hashtbl.find_opt env id with
          | Some (Loc (loc, is_mutable, false)) ->
              Hashtbl.replace env id (Loc (loc, is_mutable, true));
              v
          | _ -> v)
      | _ -> v)
  | _ -> trace1_expr (env_stack, memory) expr

and unique lst =
  List.fold_left (fun acc x -> if List.mem x acc then acc else x :: acc) [] lst

and flatten_instr ins =
  match ins with
  | SEQ (i1, i2) -> flatten_instr i1 @ flatten_instr i2
  | i -> [ i ]

and free_vars_expr expr ~bound =
  match expr with
  | NIL -> []
  | IDE id -> if List.mem id bound then [] else [ id ]
  | STR _ -> []
  | ASSIGN (id, e) ->
      (if List.mem id bound then [] else [ id ]) @ free_vars_expr e ~bound
  | CALL (_, args) ->
      List.flatten (List.map (fun e -> free_vars_expr e ~bound) args)
  | CALL_EXEC ins -> free_vars_instr ins ~bound
  | CONST _ -> []
  | UNARY_EXPR (_, e) -> free_vars_expr e ~bound
  | BINARY_EXPR (e1, _, e2) ->
      free_vars_expr e1 ~bound @ free_vars_expr e2 ~bound
  | REF _ -> []
  | REF_MUT _ -> []
  | BLOCK_EXPR ins -> free_vars_instr ins ~bound
  | PRINTSTR _ -> []
  | PRINTVAR id -> if List.mem id bound then [] else [ id ]
  | PRINTEXPR e -> free_vars_expr e ~bound
  | PUSHSTR (id, _) -> if List.mem id bound then [] else [ id ]

and free_vars_instr_list ins_list bound =
  match ins_list with
  | [] -> []
  | i :: rest ->
      let free_i, bound_i = free_vars_instr_binding i ~bound in
      let free_rest = free_vars_instr_list rest (bound @ bound_i) in
      free_i @ free_rest

and free_vars_instr_binding ins ~bound =
  match ins with
  | VARDECL_INIT (_, id, e) ->
      let free_e = free_vars_expr e ~bound in
      (free_e, [ id ])
  | IF (e, i) ->
      let free_e = free_vars_expr e ~bound in
      let free_i = free_vars_instr i ~bound in
      (free_e @ free_i, [])
  | IFE (e, i1, i2) ->
      let free_e = free_vars_expr e ~bound in
      let free_i1 = free_vars_instr i1 ~bound in
      let free_i2 = free_vars_instr i2 ~bound in
      (free_e @ free_i1 @ free_i2, [])
  | LOOP i -> (free_vars_instr i ~bound, [])
  | EXPR e -> (free_vars_expr e ~bound, [])
  | RET e -> (free_vars_expr e ~bound, [])
  | BLOCK i -> (free_vars_instr i ~bound, [])
  | BLOCK_EXEC i -> (free_vars_instr i ~bound, [])
  | FUNDECL (id, params, i) ->
      let new_bound = (id :: List.map fst params) @ bound in
      (free_vars_instr i ~bound:new_bound, [])
  | FUNDECL_ARROW (id, params, i, _) ->
      let new_bound = (id :: List.map fst params) @ bound in
      (free_vars_instr i ~bound:new_bound, [])
  | SEQ _ -> (free_vars_instr ins ~bound, [])
  | _ -> ([], [])

and free_vars_instr ins ~bound = free_vars_instr_list (flatten_instr ins) bound

and small_reduce_args (env_stack, memory) args =
  match args with
  | [] -> []
  | CONST n :: t -> CONST n :: small_reduce_args (env_stack, memory) t
  | STR s :: t -> STR s :: small_reduce_args (env_stack, memory) t
  | h :: t ->
      reduce_arg (env_stack, memory) h
      :: small_reduce_args (env_stack, memory) t

and evaluate_expr state expr =
  try
    let expr' = trace1_expr state expr in
    evaluate_expr state expr'
  with NoRuleApplies -> expr

and resolve_placeholders env_stack memory str =
  let regex = Str.regexp "{\\([a-zA-Z_][a-zA-Z0-9_]*\\)}" in
  let resolved =
    Str.global_substitute regex
      (fun matched ->
        let var_name = Str.matched_group 1 matched in
        try
          match find_env env_stack var_name with
          | Loc (loc, _, is_moved) -> (
              if is_moved then
                raise
                  (GenericExc
                     ("Cannot use variable '" ^ var_name
                    ^ "' as it has been moved"));
              match Hashtbl.find memory loc with
              | Int n -> string_of_int n
              | Str s -> s)
          | Ref loc | RefMut loc -> (
              match Hashtbl.find memory loc with
              | Int n -> string_of_int n
              | Str s -> s)
          | _ ->
              raise
                (GenericExc ("Variable '" ^ var_name ^ "' is not printable"))
        with Not_found -> "{" ^ var_name ^ "}")
      str
  in
  resolved

and trace1_expr (env_stack, memory) = function
  | PRINTVAR v -> (
      try
        let envval = find_env env_stack v in
        match envval with
        | Loc (loc, _, is_moved) -> (
            if is_moved then raise (GenericExc ("moved var " ^ v));
            match Hashtbl.find memory loc with
            | Int n ->
                print_endline (string_of_int n);
                CONST n
            | Str s ->
                print_endline s;
                STR s)
        | Ref loc | RefMut loc -> (
            match Hashtbl.find memory loc with
            | Int n ->
                print_endline (string_of_int n);
                CONST n
            | Str s ->
                print_endline s;
                STR s)
        | Fun _ | FunArrow _ -> raise (Invalid_argument v)
      with Not_found -> failwith ("Variable '" ^ v ^ "' not found"))
  | PRINTSTR s ->
      let resolved = resolve_placeholders env_stack memory s in
      print_endline resolved;
      STR resolved
  | PUSHSTR (id, str) -> (
      match find_env env_stack id with
      | Loc (memloc, true, borrowed) -> (
          if borrowed then raise (RacingData (id, Mutable, Immutable))
          else
            match Hashtbl.find memory memloc with
            | Str s ->
                let concatenated = s ^ str in
                update_mem memory memloc (Str concatenated);
                STR concatenated
            | _ -> raise (Invalid_argument id))
      | Loc (_, false, _) -> raise (Invalid_argument id)
      | Ref _ -> raise (RacingData (id, Mutable, Immutable))
      | RefMut memloc -> (
          match Hashtbl.find memory memloc with
          | Str s ->
              let concatenated = s ^ str in
              update_mem memory memloc (Str concatenated);
              STR concatenated
          | _ -> raise (Invalid_argument id))
      | _ -> raise (UndeclaredVariable id))
  | IDE id -> (
      match find_env env_stack id with
      | Loc (memloc, _, _) -> (
          match Hashtbl.find memory memloc with
          | Int n -> CONST n
          | Str s -> STR s)
      | Ref memloc | RefMut memloc -> (
          match Hashtbl.find memory memloc with
          | Int n -> CONST n
          | Str s -> STR s)
      | _ -> raise (UndeclaredVariable id))
  | ASSIGN (id, CONST n) -> (
      match find_env env_stack id with
      | Loc (memloc, is_mutable, _) ->
          if not is_mutable then raise (Invalid_argument id)
          else (
            update_mem memory memloc (Int n);
            CONST n)
      | _ -> raise (UndeclaredVariable id))
  | ASSIGN (id, IDE src_id) -> (
      match (find_env env_stack id, find_env env_stack src_id) with
      | Loc (dst_loc, is_mutable, _), Loc (src_loc, _, is_moved) -> (
          if is_moved then raise (Invalid_argument src_id);
          if not is_mutable then raise (Invalid_argument id);
          let value = Hashtbl.find memory src_loc in
          update_mem memory dst_loc value;
          Hashtbl.replace (Stack.top env_stack) src_id
            (Loc (src_loc, false, true));
          match value with
          | Int n -> CONST n
          | Str s -> STR s)
      | _ -> raise NoRuleApplies)
  | ASSIGN (id, expr) -> (
      match find_env env_stack id with
      | Loc (memloc, is_mutable, _) ->
          if not is_mutable then raise (Invalid_argument id)
          else
            let value = trace1_expr (env_stack, memory) expr in
            update_mem memory memloc
              (match value with
              | CONST n -> Int n
              | STR s -> Str s
              | _ -> failwith "Invalid value for assignment");
            value
      | RefMut memloc ->
          let value = trace1_expr (env_stack, memory) expr in
          update_mem memory memloc
            (match value with
            | CONST n -> Int n
            | STR s -> Str s
            | _ -> failwith "Invalid value for assignment");
          value
      | Ref _ -> failwith ("Cannot assign to borrowed variable " ^ id)
      | _ -> raise (UndeclaredVariable id))
  | UNARY_EXPR (BORROW, IDE id) -> (
      match find_env env_stack id with
      | Loc (loc, _, is_moved) ->
          if is_moved then raise (Invalid_argument id);
          REF loc
      | _ -> failwith ("Cannot borrow non-variable: " ^ id))
  | UNARY_EXPR (BORROW_MUT, IDE id) -> (
      match find_env env_stack id with
      | Loc (loc, _, is_moved) ->
          if is_moved then raise (Invalid_argument id);
          if is_borrowed env_stack id then raise (BorrowMutErr id);
          add_env env_stack id (RefMut loc);
          IDE id
      | _ -> failwith ("Cannot borrow non-variable: " ^ id))
  | REF loc -> (
      match Hashtbl.find_opt memory loc with
      | Some (Int n) -> CONST n
      | Some (Str s) -> STR s
      | None ->
          failwith
            ("[Error] Memory location not found for REF loc: "
           ^ string_of_int loc))
  | BINARY_EXPR (CONST left, op, CONST right) -> (
      match op with
      | ADD -> CONST (left + right)
      | SUB -> CONST (left - right)
      | MUL -> CONST (left * right)
      | DIV -> CONST (left / right)
      | MOD -> CONST (left mod right)
      | EQ -> CONST (int_of_bool (left = right))
      | NEQ -> CONST (int_of_bool (left <> right))
      | GT -> CONST (int_of_bool (left > right))
      | LT -> CONST (int_of_bool (left < right))
      | GEQ -> CONST (int_of_bool (left >= right))
      | LEQ -> CONST (int_of_bool (left <= right))
      | LAND -> CONST (int_of_bool (bool_of_int left && bool_of_int right))
      | LOR -> CONST (int_of_bool (bool_of_int left || bool_of_int right)))
  | BINARY_EXPR (CONST left, op, right) ->
      let right_val =
        match trace1_expr (env_stack, memory) right with
        | CONST n -> n
        | IDE id -> (
            match find_env env_stack id with
            | Loc (memloc, _, _) -> (
                match Hashtbl.find memory memloc with
                | Int n -> n
                | _ -> failwith ("Expected integer for variable '" ^ id ^ "'"))
            | _ -> failwith ("Variable '" ^ id ^ "' not found"))
        | _ -> failwith "Right operand is not a valid integer expression"
      in
      trace1_expr (env_stack, memory)
        (BINARY_EXPR (CONST left, op, CONST right_val))
  | BINARY_EXPR (left, op, CONST right) ->
      let left_val =
        match trace1_expr (env_stack, memory) left with
        | CONST n -> n
        | IDE id -> (
            match find_env env_stack id with
            | Loc (memloc, _, _) -> (
                match Hashtbl.find memory memloc with
                | Int n -> n
                | _ -> failwith ("Expected integer for variable '" ^ id ^ "'"))
            | _ -> failwith ("Variable '" ^ id ^ "' not found"))
        | _ -> failwith "Left operand is not a valid integer expression"
      in
      trace1_expr (env_stack, memory)
        (BINARY_EXPR (CONST left_val, op, CONST right))
  | BINARY_EXPR (left, op, right) ->
      let left_val =
        match trace1_expr (env_stack, memory) left with
        | CONST n -> n
        | IDE id -> (
            match find_env env_stack id with
            | Loc (memloc, _, _) -> (
                match Hashtbl.find memory memloc with
                | Int n -> n
                | _ -> failwith ("Expected integer for variable '" ^ id ^ "'"))
            | _ -> failwith ("Variable '" ^ id ^ "' not found"))
        | _ -> failwith "Left operand is not a valid integer expression"
      in
      let right_val =
        match trace1_expr (env_stack, memory) right with
        | CONST n -> n
        | IDE id -> (
            match find_env env_stack id with
            | Loc (memloc, _, _) -> (
                match Hashtbl.find memory memloc with
                | Int n -> n
                | _ -> failwith ("Expected integer for variable '" ^ id ^ "'"))
            | _ -> failwith ("Variable '" ^ id ^ "' not found"))
        | _ -> failwith "Right operand is not a valid integer expression"
      in
      trace1_expr (env_stack, memory)
        (BINARY_EXPR (CONST left_val, op, CONST right_val))
  | CALL (id, args) when call_args_reduced args = true -> (
      match find_env env_stack id with
      | Fun (params, ins, fun_env) | FunArrow (params, ins, _, fun_env) ->
          let args_len = List.length args in
          let params_len = List.length params in
          if args_len = params_len then (
            Stack.push (Hashtbl.copy fun_env) env_stack;
            let rec set_frame = function
              | [], [] -> ()
              | (param, _) :: params', CONST n :: args' ->
                  let loc = get_free_mem_loc memory in
                  add_mem memory loc (Int n);
                  add_env env_stack param (Loc (loc, false, false));
                  set_frame (params', args')
              | (param, _) :: params', STR s :: args' ->
                  let loc = get_free_mem_loc memory in
                  add_mem memory loc (Str s);
                  add_env env_stack param (Loc (loc, false, false));
                  set_frame (params', args')
              | (param, _) :: params', UNARY_EXPR (BORROW, IDE src_id) :: args'
                -> (
                  match find_env env_stack src_id with
                  | Loc (src_loc, _, _) | Ref src_loc -> (
                      match Hashtbl.find memory src_loc with
                      | Str s ->
                          let loc = get_free_mem_loc memory in
                          add_mem memory loc (Str s);
                          add_env env_stack param (Loc (loc, false, false));
                          set_frame (params', args')
                      | Int n ->
                          let loc = get_free_mem_loc memory in
                          add_mem memory loc (Int n);
                          add_env env_stack param (Loc (loc, false, false));
                          set_frame (params', args'))
                  | _ -> raise (GenericExc "Expected variable reference"))
              | _ -> raise (GenericExc "Unexpected argument or parameter")
            in
            set_frame (params, args);
            CALL_EXEC ins)
          else raise (WrongArguments (args_len, params_len))
      | _ -> raise (Invalid_argument id))
  | CALL (id, args) -> CALL (id, small_reduce_args (env_stack, memory) args)
  | CALL_EXEC ins -> (
      match trace1_instr (env_stack, memory) (Instr ins) with
      | St ->
          let _ = pop_frame env_stack in
          NIL
      | Ret n ->
          let _ = pop_frame env_stack in
          CONST n
      | Instr ins' -> CALL_EXEC ins')
  | BLOCK_EXPR ins -> (
      match trace1_instr (env_stack, memory) (Instr ins) with
      | St -> NIL
      | Ret n -> CONST n
      | Instr ins' -> trace1_expr (env_stack, memory) (BLOCK_EXPR ins'))
  | _ -> raise NoRuleApplies

and trace1_instr (env_stack, memory) = function
  | St -> raise NoRuleApplies
  | Ret _ -> raise NoRuleApplies
  | Instr ins -> (
      match ins with
      | EMPTY -> St
      | BREAK -> raise BreakException
      | EXPR (CONST _) -> St
      | EXPR (STR _) -> St
      | EXPR NIL -> St
      | RET NIL -> St
      | IF (CONST 0, _) -> St
      | IF (CONST _, ins') -> Instr ins'
      | IF (expr, ins') ->
          Instr (IF (trace1_expr (env_stack, memory) expr, ins'))
      | IFE (CONST 0, _, ins2) -> Instr ins2
      | IFE (CONST _, ins1, _) -> Instr ins1
      | IFE (expr, ins1, ins2) ->
          Instr (IFE (trace1_expr (env_stack, memory) expr, ins1, ins2))
      | LOOP ins' -> Instr (SEQ (ins', LOOP ins'))
      | EXPR expr' -> Instr (EXPR (trace1_expr (env_stack, memory) expr'))
      | RET (CONST n) -> Ret n
      | RET expr -> Instr (RET (trace1_expr (env_stack, memory) expr))
      | BLOCK ins' ->
          add_frame env_stack;
          Instr (BLOCK_EXEC ins')
      | BLOCK_EXEC ins' -> (
          match trace1_instr (env_stack, memory) (Instr ins') with
          | St ->
              let _ = pop_frame env_stack in
              St
          | Ret n ->
              let _ = pop_frame env_stack in
              Ret n
          | Instr ins'' -> Instr (BLOCK_EXEC ins''))
      | VARDECL_INIT (mutability, id, expr) -> (
          let is_mutable =
            match mutability with
            | Mutable -> true
            | Immutable -> false
          in
          let loc = get_free_mem_loc memory in
          match expr with
          | UNARY_EXPR (BORROW_MUT, IDE src_id) -> (
              match find_env env_stack src_id with
              | Loc (src_loc, true, _) ->
                  add_env env_stack id (RefMut src_loc);
                  St
              | Loc (_, false, _) -> raise (BorrowMutErr src_id)
              | _ -> raise (Invalid_argument src_id))
          | UNARY_EXPR (BORROW, IDE src_id) -> (
              match find_env env_stack src_id with
              | Loc (src_loc, mut, _) ->
                  if mut then
                    Hashtbl.replace (Stack.top env_stack) src_id
                      (Loc (src_loc, mut, true));
                  add_env env_stack id (Ref src_loc);
                  St
              | _ -> raise (Invalid_argument src_id))
          | IDE src_id -> (
              match find_env env_stack src_id with
              | Loc (src_loc, _, is_moved) ->
                  if is_moved then raise (Invalid_argument id);
                  let value = Hashtbl.find memory src_loc in
                  add_mem memory loc value;
                  add_env env_stack id (Loc (loc, is_mutable, false));
                  Hashtbl.replace (Stack.top env_stack) src_id
                    (Loc (src_loc, false, true));
                  St
              | _ -> raise (UndeclaredVariable src_id))
          | _ -> (
              let value = evaluate_expr (env_stack, memory) expr in
              match value with
              | CONST n ->
                  add_mem memory loc (Int n);
                  add_env env_stack id (Loc (loc, is_mutable, false));
                  St
              | STR s ->
                  add_mem memory loc (Str s);
                  add_env env_stack id (Loc (loc, is_mutable, false));
                  St
              | _ ->
                  let value = trace1_expr (env_stack, memory) expr in
                  add_mem memory loc
                    (match value with
                    | CONST n -> Int n
                    | STR s -> Str s
                    | _ -> failwith "Invalid generic value");
                  add_env env_stack id (Loc (loc, is_mutable, false));
                  St))
      | FUNDECL (id, params, ins') -> (
          let env = Stack.top env_stack in
          if Hashtbl.mem env id then raise (UndeclaredVariable id)
          else
            let captured_env = Memory.capture_fun_env env in
            let bound = id :: List.map fst params in
            let free = unique (free_vars_instr ins' ~bound) in
            match free with
            | [] ->
                add_env env_stack id (Fun (params, ins', captured_env));
                St
            | v :: _ -> raise (UndeclaredVariable v))
      | FUNDECL_ARROW (id, params, ins', ret_typ) -> (
          let env = Stack.top env_stack in
          let captured_env = Memory.capture_fun_env env in
          let bound = id :: List.map fst params in
          let free = unique (free_vars_instr ins' ~bound) in
          match free with
          | [] ->
              add_env env_stack id
                (FunArrow (params, ins', ret_typ, captured_env));
              St
          | v :: _ -> raise (UndeclaredVariable v))
      | SEQ (ins1, ins2) -> (
          try
            match trace1_instr (env_stack, memory) (Instr ins1) with
            | St -> Instr ins2
            | Ret n -> Ret n
            | Instr ins1' -> Instr (SEQ (ins1', ins2))
          with BreakException -> St))

let rec trace_expr (state : state) (expr : expression) =
  try expr :: trace_expr state (trace1_expr state expr)
  with NoRuleApplies -> [ expr ]

let rec trace_instr gas state conf =
  if gas <= 0 then raise (TraceError (OutOfGas gas));
  match conf with
  | Instr ins -> (
      try
        match trace1_instr state (Instr ins) with
        | St -> gas - 1
        | Ret _ -> gas - 1
        | Instr next -> trace_instr (gas - 1) state (Instr next)
      with NoRuleApplies -> gas)
  | _ -> gas

let trace gas program =
  let state = (init_stack (), init_memory ()) in
  try
    let remaining_gas = trace_instr gas state (Instr program) in
    let outputs =
      trace_expr state (CALL ("main", []))
      |> List.filter_map (function
           | STR s -> Some s
           | _ -> None)
      |> String.concat "\n"
    in
    (remaining_gas, Ok outputs)
  with
  | TraceError err -> (gas, Error err)
  | Invalid_argument msg -> (gas, Error (CannotMutate msg))
  | UndeclaredVariable var -> (gas, Error (UnboundVar var))
  | MovedVariable var -> (gas, Error (MovedValue var))
  | BorrowMutErr var -> (gas, Error (MutBorrowOfNonMut var))
  | RacingData (msg, var1, var2) -> (gas, Error (DataRace (msg, var1, var2)))
  | Not_found -> (gas, Error (UnboundVar "Variable not found"))
  | NoRuleApplies -> (gas, Error (OutOfGas gas))
  | e -> (gas, Error (TypeError (Printexc.to_string e)))
