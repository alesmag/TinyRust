open Ast

exception MovedVariable of string
exception UndeclaredVariable of string
exception NoRuleApplies
exception BorrowMutErr of string
exception WrongArguments of int * int
exception RacingData of identifier * mut * mut
exception GenericExc of string
exception BreakException

type loc = int
type ide = string
type memval = Int of int | Str of string

type envval =
  | Loc of loc * bool * bool (* loc, mutability, moved *)
  | Fun of (Ast.parameters * Ast.instruction * environment)
    (* params, instructions *)
  | FunArrow of (Ast.parameters * Ast.instruction * Ast.typ * environment)
    (* params, instructions, return type *)
  | Ref of loc
  | RefMut of loc

and environment = (ide, envval) Hashtbl.t
type memory = (loc, memval) Hashtbl.t
type env_stack = environment Stack.t

let init_memory () : memory = Hashtbl.create 0

let init_stack () : env_stack =
  let env_stack = Stack.create () in
  let env = Hashtbl.create 0 in
  Stack.push env env_stack;
  env_stack

let add_mem (memory : memory) loc memval = Hashtbl.add memory loc memval

let update_mem (memory : memory) loc memval = Hashtbl.replace memory loc memval

let find_env (env_stack : env_stack) ide =
  match Hashtbl.find_opt (Stack.top env_stack) ide with
  | Some (Loc (_, true, true)) -> raise (RacingData (ide, Mutable, Immutable))
  | Some (Loc (_, _, true)) -> raise (MovedVariable ide)
  | Some envval -> envval
  | None -> raise (UndeclaredVariable ide)

let add_env (env_stack : env_stack) ide envval =
  Hashtbl.replace (Stack.top env_stack) ide envval

let add_frame (env_stack : env_stack) =
  let env = Hashtbl.copy (Stack.top env_stack) in
  Stack.push env env_stack

let pop_frame (env_stack : env_stack) = Stack.pop env_stack

let is_borrowed env_stack id =
  try
    match find_env env_stack id with
    | Ref _ | RefMut _ -> true
    | _ -> false
  with UndeclaredVariable _ -> false

let capture_fun_env (env : environment) : environment =
  let new_env = Hashtbl.create (Hashtbl.length env) in
  Hashtbl.iter
    (fun key value ->
      match value with
      | Fun _ | FunArrow _ -> Hashtbl.add new_env key value
      | _ -> ())
    env;
  new_env
