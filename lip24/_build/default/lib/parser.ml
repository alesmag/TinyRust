
module MenhirBasics = struct
  
  exception Error
  
  let _eRR =
    fun _s ->
      raise Error
  
  type token = 
    | VAR of (
# 12 "lib/parser.mly"
       (string)
# 15 "lib/parser.ml"
  )
    | TSTRING
    | SUB
    | STRING of (
# 14 "lib/parser.mly"
       (string)
# 22 "lib/parser.ml"
  )
    | SEMICOLON
    | RPAREN
    | RBRACE
    | PUSHSTR
    | PRINTLN
    | OR
    | NEQ
    | MUT
    | MUL
    | MOD
    | LT
    | LPAREN
    | LOOP
    | LET
    | LEQ
    | LBRACE
    | IF
    | I32
    | GT
    | GEQ
    | FROM
    | FN
    | EQ
    | EOF
    | ELSE
    | DIV
    | CONST of (
# 13 "lib/parser.mly"
       (string)
# 53 "lib/parser.ml"
  )
    | COMMA
    | COL
    | BREAK
    | BORROW
    | ASSIGNMENT
    | ARROW
    | AND
    | ADD
  
end

include MenhirBasics

# 1 "lib/parser.mly"
  
  open Ast

  let rec seq_of_ins_list = function
    | []              -> EMPTY
    | [ins]           -> ins
    | [ins; ins']     -> SEQ (ins, ins')
    | ins :: ins_list -> SEQ (ins, seq_of_ins_list ins_list)

# 78 "lib/parser.ml"

type ('s, 'r) _menhir_state = 
  | MenhirState000 : ('s, _menhir_box_main) _menhir_state
    (** State 000.
        Stack shape : .
        Start symbol: main. *)

  | MenhirState001 : (('s, _menhir_box_main) _menhir_cell1_LET, _menhir_box_main) _menhir_state
    (** State 001.
        Stack shape : LET.
        Start symbol: main. *)

  | MenhirState003 : (('s, _menhir_box_main) _menhir_cell1_VAR, _menhir_box_main) _menhir_state
    (** State 003.
        Stack shape : VAR.
        Start symbol: main. *)

  | MenhirState009 : (('s, _menhir_box_main) _menhir_cell1_VAR, _menhir_box_main) _menhir_state
    (** State 009.
        Stack shape : VAR.
        Start symbol: main. *)

  | MenhirState018 : (('s, _menhir_box_main) _menhir_cell1_PRINTLN, _menhir_box_main) _menhir_state
    (** State 018.
        Stack shape : PRINTLN.
        Start symbol: main. *)

  | MenhirState021 : (('s, _menhir_box_main) _menhir_cell1_VAR, _menhir_box_main) _menhir_state
    (** State 021.
        Stack shape : VAR.
        Start symbol: main. *)

  | MenhirState022 : (('s, _menhir_box_main) _menhir_cell1_LPAREN, _menhir_box_main) _menhir_state
    (** State 022.
        Stack shape : LPAREN.
        Start symbol: main. *)

  | MenhirState023 : (('s, _menhir_box_main) _menhir_cell1_LBRACE, _menhir_box_main) _menhir_state
    (** State 023.
        Stack shape : LBRACE.
        Start symbol: main. *)

  | MenhirState024 : ((('s, _menhir_box_main) _menhir_cell1_LBRACE, _menhir_box_main) _menhir_cell1_list_declaration_, _menhir_box_main) _menhir_state
    (** State 024.
        Stack shape : LBRACE list(declaration).
        Start symbol: main. *)

  | MenhirState026 : (('s, _menhir_box_main) _menhir_cell1_LOOP, _menhir_box_main) _menhir_state
    (** State 026.
        Stack shape : LOOP.
        Start symbol: main. *)

  | MenhirState027 : (('s, _menhir_box_main) _menhir_cell1_LBRACE, _menhir_box_main) _menhir_state
    (** State 027.
        Stack shape : LBRACE.
        Start symbol: main. *)

  | MenhirState028 : ((('s, _menhir_box_main) _menhir_cell1_LBRACE, _menhir_box_main) _menhir_cell1_list_declaration_, _menhir_box_main) _menhir_state
    (** State 028.
        Stack shape : LBRACE list(declaration).
        Start symbol: main. *)

  | MenhirState029 : (('s, _menhir_box_main) _menhir_cell1_IF, _menhir_box_main) _menhir_state
    (** State 029.
        Stack shape : IF.
        Start symbol: main. *)

  | MenhirState031 : (('s, _menhir_box_main) _menhir_cell1_BORROW, _menhir_box_main) _menhir_state
    (** State 031.
        Stack shape : BORROW.
        Start symbol: main. *)

  | MenhirState033 : ((('s, _menhir_box_main) _menhir_cell1_BORROW, _menhir_box_main) _menhir_cell1_MUT, _menhir_box_main) _menhir_state
    (** State 033.
        Stack shape : BORROW MUT.
        Start symbol: main. *)

  | MenhirState038 : ((('s, _menhir_box_main) _menhir_cell1_IF, _menhir_box_main) _menhir_cell1_expression, _menhir_box_main) _menhir_state
    (** State 038.
        Stack shape : IF expression.
        Start symbol: main. *)

  | MenhirState041 : (('s, _menhir_box_main) _menhir_cell1_FN _menhir_cell0_VAR, _menhir_box_main) _menhir_state
    (** State 041.
        Stack shape : FN VAR.
        Start symbol: main. *)

  | MenhirState043 : (('s, _menhir_box_main) _menhir_cell1_VAR, _menhir_box_main) _menhir_state
    (** State 043.
        Stack shape : VAR.
        Start symbol: main. *)

  | MenhirState046 : ((('s, _menhir_box_main) _menhir_cell1_VAR, _menhir_box_main) _menhir_cell1_BORROW, _menhir_box_main) _menhir_state
    (** State 046.
        Stack shape : VAR BORROW.
        Start symbol: main. *)

  | MenhirState047 : (((('s, _menhir_box_main) _menhir_cell1_VAR, _menhir_box_main) _menhir_cell1_BORROW, _menhir_box_main) _menhir_cell1_MUT, _menhir_box_main) _menhir_state
    (** State 047.
        Stack shape : VAR BORROW MUT.
        Start symbol: main. *)

  | MenhirState054 : ((('s, _menhir_box_main) _menhir_cell1_FN _menhir_cell0_VAR, _menhir_box_main) _menhir_cell1_loption_separated_nonempty_list_COMMA_fpar__, _menhir_box_main) _menhir_state
    (** State 054.
        Stack shape : FN VAR loption(separated_nonempty_list(COMMA,fpar)).
        Start symbol: main. *)

  | MenhirState055 : (('s, _menhir_box_main) _menhir_cell1_LBRACE, _menhir_box_main) _menhir_state
    (** State 055.
        Stack shape : LBRACE.
        Start symbol: main. *)

  | MenhirState056 : ((('s, _menhir_box_main) _menhir_cell1_LBRACE, _menhir_box_main) _menhir_cell1_list_declaration_, _menhir_box_main) _menhir_state
    (** State 056.
        Stack shape : LBRACE list(declaration).
        Start symbol: main. *)

  | MenhirState060 : (((('s, _menhir_box_main) _menhir_cell1_LBRACE, _menhir_box_main) _menhir_cell1_list_declaration_, _menhir_box_main) _menhir_cell1_list_instruction_, _menhir_box_main) _menhir_state
    (** State 060.
        Stack shape : LBRACE list(declaration) list(instruction).
        Start symbol: main. *)

  | MenhirState067 : (('s, _menhir_box_main) _menhir_cell1_binary_expr, _menhir_box_main) _menhir_state
    (** State 067.
        Stack shape : binary_expr.
        Start symbol: main. *)

  | MenhirState069 : (('s, _menhir_box_main) _menhir_cell1_binary_expr, _menhir_box_main) _menhir_state
    (** State 069.
        Stack shape : binary_expr.
        Start symbol: main. *)

  | MenhirState071 : (('s, _menhir_box_main) _menhir_cell1_binary_expr, _menhir_box_main) _menhir_state
    (** State 071.
        Stack shape : binary_expr.
        Start symbol: main. *)

  | MenhirState073 : (('s, _menhir_box_main) _menhir_cell1_binary_expr, _menhir_box_main) _menhir_state
    (** State 073.
        Stack shape : binary_expr.
        Start symbol: main. *)

  | MenhirState075 : (('s, _menhir_box_main) _menhir_cell1_binary_expr, _menhir_box_main) _menhir_state
    (** State 075.
        Stack shape : binary_expr.
        Start symbol: main. *)

  | MenhirState077 : (('s, _menhir_box_main) _menhir_cell1_binary_expr, _menhir_box_main) _menhir_state
    (** State 077.
        Stack shape : binary_expr.
        Start symbol: main. *)

  | MenhirState079 : (('s, _menhir_box_main) _menhir_cell1_binary_expr, _menhir_box_main) _menhir_state
    (** State 079.
        Stack shape : binary_expr.
        Start symbol: main. *)

  | MenhirState081 : (('s, _menhir_box_main) _menhir_cell1_binary_expr, _menhir_box_main) _menhir_state
    (** State 081.
        Stack shape : binary_expr.
        Start symbol: main. *)

  | MenhirState083 : (('s, _menhir_box_main) _menhir_cell1_binary_expr, _menhir_box_main) _menhir_state
    (** State 083.
        Stack shape : binary_expr.
        Start symbol: main. *)

  | MenhirState085 : (('s, _menhir_box_main) _menhir_cell1_binary_expr, _menhir_box_main) _menhir_state
    (** State 085.
        Stack shape : binary_expr.
        Start symbol: main. *)

  | MenhirState087 : (('s, _menhir_box_main) _menhir_cell1_binary_expr, _menhir_box_main) _menhir_state
    (** State 087.
        Stack shape : binary_expr.
        Start symbol: main. *)

  | MenhirState089 : (('s, _menhir_box_main) _menhir_cell1_binary_expr, _menhir_box_main) _menhir_state
    (** State 089.
        Stack shape : binary_expr.
        Start symbol: main. *)

  | MenhirState091 : (('s, _menhir_box_main) _menhir_cell1_binary_expr, _menhir_box_main) _menhir_state
    (** State 091.
        Stack shape : binary_expr.
        Start symbol: main. *)

  | MenhirState093 : (('s, _menhir_box_main) _menhir_cell1_instruction, _menhir_box_main) _menhir_state
    (** State 093.
        Stack shape : instruction.
        Start symbol: main. *)

  | MenhirState100 : (('s, _menhir_box_main) _menhir_cell1_declaration, _menhir_box_main) _menhir_state
    (** State 100.
        Stack shape : declaration.
        Start symbol: main. *)

  | MenhirState102 : (((('s, _menhir_box_main) _menhir_cell1_FN _menhir_cell0_VAR, _menhir_box_main) _menhir_cell1_loption_separated_nonempty_list_COMMA_fpar__, _menhir_box_main) _menhir_cell1_ARROW, _menhir_box_main) _menhir_state
    (** State 102.
        Stack shape : FN VAR loption(separated_nonempty_list(COMMA,fpar)) ARROW.
        Start symbol: main. *)

  | MenhirState103 : ((((('s, _menhir_box_main) _menhir_cell1_FN _menhir_cell0_VAR, _menhir_box_main) _menhir_cell1_loption_separated_nonempty_list_COMMA_fpar__, _menhir_box_main) _menhir_cell1_ARROW, _menhir_box_main) _menhir_cell1_typ, _menhir_box_main) _menhir_state
    (** State 103.
        Stack shape : FN VAR loption(separated_nonempty_list(COMMA,fpar)) ARROW typ.
        Start symbol: main. *)

  | MenhirState107 : (('s, _menhir_box_main) _menhir_cell1_fpar, _menhir_box_main) _menhir_state
    (** State 107.
        Stack shape : fpar.
        Start symbol: main. *)

  | MenhirState110 : (((('s, _menhir_box_main) _menhir_cell1_IF, _menhir_box_main) _menhir_cell1_expression, _menhir_box_main) _menhir_cell1_instruction, _menhir_box_main) _menhir_state
    (** State 110.
        Stack shape : IF expression instruction.
        Start symbol: main. *)

  | MenhirState112 : (((('s, _menhir_box_main) _menhir_cell1_LBRACE, _menhir_box_main) _menhir_cell1_list_declaration_, _menhir_box_main) _menhir_cell1_list_instruction_, _menhir_box_main) _menhir_state
    (** State 112.
        Stack shape : LBRACE list(declaration) list(instruction).
        Start symbol: main. *)

  | MenhirState117 : (((('s, _menhir_box_main) _menhir_cell1_LBRACE, _menhir_box_main) _menhir_cell1_list_declaration_, _menhir_box_main) _menhir_cell1_list_instruction_, _menhir_box_main) _menhir_state
    (** State 117.
        Stack shape : LBRACE list(declaration) list(instruction).
        Start symbol: main. *)

  | MenhirState129 : (('s, _menhir_box_main) _menhir_cell1_expression, _menhir_box_main) _menhir_state
    (** State 129.
        Stack shape : expression.
        Start symbol: main. *)

  | MenhirState133 : (('s, _menhir_box_main) _menhir_cell1_VAR _menhir_cell0_option___anonymous_0_, _menhir_box_main) _menhir_state
    (** State 133.
        Stack shape : VAR option(__anonymous_0).
        Start symbol: main. *)

  | MenhirState135 : ((('s, _menhir_box_main) _menhir_cell1_LET, _menhir_box_main) _menhir_cell1_MUT, _menhir_box_main) _menhir_state
    (** State 135.
        Stack shape : LET MUT.
        Start symbol: main. *)

  | MenhirState137 : (('s, _menhir_box_main) _menhir_cell1_VAR, _menhir_box_main) _menhir_state
    (** State 137.
        Stack shape : VAR.
        Start symbol: main. *)

  | MenhirState140 : (('s, _menhir_box_main) _menhir_cell1_VAR _menhir_cell0_option___anonymous_2_, _menhir_box_main) _menhir_state
    (** State 140.
        Stack shape : VAR option(__anonymous_2).
        Start symbol: main. *)

  | MenhirState150 : (('s, _menhir_box_main) _menhir_cell1_definition, _menhir_box_main) _menhir_state
    (** State 150.
        Stack shape : definition.
        Start symbol: main. *)


and ('s, 'r) _menhir_cell1_binary_expr = 
  | MenhirCell1_binary_expr of 's * ('s, 'r) _menhir_state * (Ast.expression)

and ('s, 'r) _menhir_cell1_declaration = 
  | MenhirCell1_declaration of 's * ('s, 'r) _menhir_state * (Ast.program)

and ('s, 'r) _menhir_cell1_definition = 
  | MenhirCell1_definition of 's * ('s, 'r) _menhir_state * (Ast.program)

and ('s, 'r) _menhir_cell1_expression = 
  | MenhirCell1_expression of 's * ('s, 'r) _menhir_state * (Ast.expression)

and ('s, 'r) _menhir_cell1_fpar = 
  | MenhirCell1_fpar of 's * ('s, 'r) _menhir_state * (string * Ast.typ)

and ('s, 'r) _menhir_cell1_instruction = 
  | MenhirCell1_instruction of 's * ('s, 'r) _menhir_state * (Ast.program)

and ('s, 'r) _menhir_cell1_list_declaration_ = 
  | MenhirCell1_list_declaration_ of 's * ('s, 'r) _menhir_state * (Ast.program list)

and ('s, 'r) _menhir_cell1_list_instruction_ = 
  | MenhirCell1_list_instruction_ of 's * ('s, 'r) _menhir_state * (Ast.program list)

and ('s, 'r) _menhir_cell1_loption_separated_nonempty_list_COMMA_fpar__ = 
  | MenhirCell1_loption_separated_nonempty_list_COMMA_fpar__ of 's * ('s, 'r) _menhir_state * (Ast.parameters)

and 's _menhir_cell0_option___anonymous_0_ = 
  | MenhirCell0_option___anonymous_0_ of 's * (Ast.expression option)

and 's _menhir_cell0_option___anonymous_2_ = 
  | MenhirCell0_option___anonymous_2_ of 's * (Ast.expression option)

and ('s, 'r) _menhir_cell1_typ = 
  | MenhirCell1_typ of 's * ('s, 'r) _menhir_state * (Ast.typ)

and ('s, 'r) _menhir_cell1_ARROW = 
  | MenhirCell1_ARROW of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_BORROW = 
  | MenhirCell1_BORROW of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_FN = 
  | MenhirCell1_FN of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_IF = 
  | MenhirCell1_IF of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_LBRACE = 
  | MenhirCell1_LBRACE of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_LET = 
  | MenhirCell1_LET of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_LOOP = 
  | MenhirCell1_LOOP of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_LPAREN = 
  | MenhirCell1_LPAREN of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_MUT = 
  | MenhirCell1_MUT of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_PRINTLN = 
  | MenhirCell1_PRINTLN of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_VAR = 
  | MenhirCell1_VAR of 's * ('s, 'r) _menhir_state * (
# 12 "lib/parser.mly"
       (string)
# 407 "lib/parser.ml"
)

and 's _menhir_cell0_VAR = 
  | MenhirCell0_VAR of 's * (
# 12 "lib/parser.mly"
       (string)
# 414 "lib/parser.ml"
)

and _menhir_box_main = 
  | MenhirBox_main of (Ast.program) [@@unboxed]

let _menhir_action_01 =
  fun u ->
    (
# 141 "lib/parser.mly"
                   ( u )
# 425 "lib/parser.ml"
     : (Ast.expression))

let _menhir_action_02 =
  fun e1 e2 ->
    (
# 142 "lib/parser.mly"
                                           ( BINARY_EXPR (e1, EQ, e2) )
# 433 "lib/parser.ml"
     : (Ast.expression))

let _menhir_action_03 =
  fun e1 e2 ->
    (
# 143 "lib/parser.mly"
                                            ( BINARY_EXPR (e1, NEQ, e2) )
# 441 "lib/parser.ml"
     : (Ast.expression))

let _menhir_action_04 =
  fun e1 e2 ->
    (
# 144 "lib/parser.mly"
                                           ( BINARY_EXPR (e1, GT, e2) )
# 449 "lib/parser.ml"
     : (Ast.expression))

let _menhir_action_05 =
  fun e1 e2 ->
    (
# 145 "lib/parser.mly"
                                           ( BINARY_EXPR (e1, LT, e2) )
# 457 "lib/parser.ml"
     : (Ast.expression))

let _menhir_action_06 =
  fun e1 e2 ->
    (
# 146 "lib/parser.mly"
                                            ( BINARY_EXPR (e1, GEQ, e2) )
# 465 "lib/parser.ml"
     : (Ast.expression))

let _menhir_action_07 =
  fun e1 e2 ->
    (
# 147 "lib/parser.mly"
                                            ( BINARY_EXPR (e1, LEQ, e2) )
# 473 "lib/parser.ml"
     : (Ast.expression))

let _menhir_action_08 =
  fun e1 e2 ->
    (
# 148 "lib/parser.mly"
                                            ( BINARY_EXPR (e1, LAND, e2) )
# 481 "lib/parser.ml"
     : (Ast.expression))

let _menhir_action_09 =
  fun e1 e2 ->
    (
# 149 "lib/parser.mly"
                                           ( BINARY_EXPR (e1, LOR, e2) )
# 489 "lib/parser.ml"
     : (Ast.expression))

let _menhir_action_10 =
  fun e1 e2 ->
    (
# 150 "lib/parser.mly"
                                            ( BINARY_EXPR (e1, ADD, e2) )
# 497 "lib/parser.ml"
     : (Ast.expression))

let _menhir_action_11 =
  fun e1 e2 ->
    (
# 151 "lib/parser.mly"
                                            ( BINARY_EXPR (e1, SUB, e2) )
# 505 "lib/parser.ml"
     : (Ast.expression))

let _menhir_action_12 =
  fun e1 e2 ->
    (
# 152 "lib/parser.mly"
                                            ( BINARY_EXPR (e1, MUL, e2) )
# 513 "lib/parser.ml"
     : (Ast.expression))

let _menhir_action_13 =
  fun e1 e2 ->
    (
# 153 "lib/parser.mly"
                                            ( BINARY_EXPR (e1, DIV, e2) )
# 521 "lib/parser.ml"
     : (Ast.expression))

let _menhir_action_14 =
  fun e1 e2 ->
    (
# 154 "lib/parser.mly"
                                            ( BINARY_EXPR (e1, MOD, e2) )
# 529 "lib/parser.ml"
     : (Ast.expression))

let _menhir_action_15 =
  fun decl ins opt_ret ->
    (
# 114 "lib/parser.mly"
    ( 
      match opt_ret with
      | Some ret -> BLOCK_EXPR (seq_of_ins_list (decl @ ins @ [RET ret]))
      | None -> BLOCK_EXPR (seq_of_ins_list (decl @ ins))
    )
# 541 "lib/parser.ml"
     : (Ast.expression))

let _menhir_action_16 =
  fun decl ins ->
    (
# 110 "lib/parser.mly"
    ( let seq = seq_of_ins_list (decl @ ins) in if seq = EMPTY then EMPTY else BLOCK seq )
# 549 "lib/parser.ml"
     : (Ast.program))

let _menhir_action_17 =
  fun decl ins opt_ret ->
    (
# 102 "lib/parser.mly"
    ( 
      match opt_ret with
      | Some ret -> seq_of_ins_list (decl @ ins @ [RET ret])
      | None -> seq_of_ins_list (decl @ ins)
    )
# 561 "lib/parser.ml"
     : (Ast.program))

let _menhir_action_18 =
  fun decl ->
    (
# 75 "lib/parser.mly"
    ( seq_of_ins_list decl )
# 569 "lib/parser.ml"
     : (Ast.program))

let _menhir_action_19 =
  fun decl ->
    (
# 89 "lib/parser.mly"
    ( seq_of_ins_list decl )
# 577 "lib/parser.ml"
     : (Ast.program))

let _menhir_action_20 =
  fun decl ->
    (
# 59 "lib/parser.mly"
                       ( decl )
# 585 "lib/parser.ml"
     : (Ast.program))

let _menhir_action_21 =
  fun func ->
    (
# 60 "lib/parser.mly"
                               ( func )
# 593 "lib/parser.ml"
     : (Ast.program))

let _menhir_action_22 =
  fun e id ->
    (
# 136 "lib/parser.mly"
                                         ( ASSIGN (id, e) )
# 601 "lib/parser.ml"
     : (Ast.expression))

let _menhir_action_23 =
  fun b_expr ->
    (
# 137 "lib/parser.mly"
                         ( b_expr )
# 609 "lib/parser.ml"
     : (Ast.expression))

let _menhir_action_24 =
  fun block ->
    (
# 138 "lib/parser.mly"
                       ( block )
# 617 "lib/parser.ml"
     : (Ast.expression))

let _menhir_action_25 =
  fun id t ->
    (
# 182 "lib/parser.mly"
                              ( (id, t) )
# 625 "lib/parser.ml"
     : (string * Ast.typ))

let _menhir_action_26 =
  fun id ins xs ->
    let params = 
# 241 "<standard.mly>"
    ( xs )
# 633 "lib/parser.ml"
     in
    (
# 94 "lib/parser.mly"
    ( FUNDECL (id, params, ins) )
# 638 "lib/parser.ml"
     : (Ast.program))

let _menhir_action_27 =
  fun id ins typ xs ->
    let params = 
# 241 "<standard.mly>"
    ( xs )
# 646 "lib/parser.ml"
     in
    (
# 97 "lib/parser.mly"
    ( FUNDECL_ARROW (id, params, ins, typ) )
# 651 "lib/parser.ml"
     : (Ast.program))

let _menhir_action_28 =
  fun () ->
    (
# 124 "lib/parser.mly"
              ( EMPTY )
# 659 "lib/parser.ml"
     : (Ast.program))

let _menhir_action_29 =
  fun () ->
    (
# 125 "lib/parser.mly"
                     ( BREAK )
# 667 "lib/parser.ml"
     : (Ast.program))

let _menhir_action_30 =
  fun expr ->
    (
# 126 "lib/parser.mly"
                                 ( EXPR expr )
# 675 "lib/parser.ml"
     : (Ast.program))

let _menhir_action_31 =
  fun expr ->
    (
# 127 "lib/parser.mly"
                             ( RET expr )
# 683 "lib/parser.ml"
     : (Ast.program))

let _menhir_action_32 =
  fun cond ins ->
    (
# 128 "lib/parser.mly"
                                                          ( IF (cond, ins) )
# 691 "lib/parser.ml"
     : (Ast.program))

let _menhir_action_33 =
  fun cond ins1 ins2 ->
    (
# 129 "lib/parser.mly"
                                                                        ( IFE (cond, ins1, ins2) )
# 699 "lib/parser.ml"
     : (Ast.program))

let _menhir_action_34 =
  fun ins ->
    (
# 130 "lib/parser.mly"
                            ( LOOP (ins) )
# 707 "lib/parser.ml"
     : (Ast.program))

let _menhir_action_35 =
  fun block ->
    (
# 131 "lib/parser.mly"
                               ( block )
# 715 "lib/parser.ml"
     : (Ast.program))

let _menhir_action_36 =
  fun func ->
    (
# 132 "lib/parser.mly"
                               ( func )
# 723 "lib/parser.ml"
     : (Ast.program))

let _menhir_action_37 =
  fun decl ->
    (
# 133 "lib/parser.mly"
                       ( decl )
# 731 "lib/parser.ml"
     : (Ast.program))

let _menhir_action_38 =
  fun () ->
    (
# 216 "<standard.mly>"
    ( [] )
# 739 "lib/parser.ml"
     : (Ast.program list))

let _menhir_action_39 =
  fun x xs ->
    (
# 219 "<standard.mly>"
    ( x :: xs )
# 747 "lib/parser.ml"
     : (Ast.program list))

let _menhir_action_40 =
  fun () ->
    (
# 216 "<standard.mly>"
    ( [] )
# 755 "lib/parser.ml"
     : (Ast.program list))

let _menhir_action_41 =
  fun x xs ->
    (
# 219 "<standard.mly>"
    ( x :: xs )
# 763 "lib/parser.ml"
     : (Ast.program list))

let _menhir_action_42 =
  fun () ->
    (
# 216 "<standard.mly>"
    ( [] )
# 771 "lib/parser.ml"
     : (Ast.program list))

let _menhir_action_43 =
  fun x xs ->
    (
# 219 "<standard.mly>"
    ( x :: xs )
# 779 "lib/parser.ml"
     : (Ast.program list))

let _menhir_action_44 =
  fun () ->
    (
# 145 "<standard.mly>"
    ( [] )
# 787 "lib/parser.ml"
     : (Ast.expression list))

let _menhir_action_45 =
  fun x ->
    (
# 148 "<standard.mly>"
    ( x )
# 795 "lib/parser.ml"
     : (Ast.expression list))

let _menhir_action_46 =
  fun () ->
    (
# 145 "<standard.mly>"
    ( [] )
# 803 "lib/parser.ml"
     : (Ast.parameters))

let _menhir_action_47 =
  fun x ->
    (
# 148 "<standard.mly>"
    ( x )
# 811 "lib/parser.ml"
     : (Ast.parameters))

let _menhir_action_48 =
  fun def ->
    (
# 56 "lib/parser.mly"
    ( seq_of_ins_list def )
# 819 "lib/parser.ml"
     : (Ast.program))

let _menhir_action_49 =
  fun () ->
    (
# 111 "<standard.mly>"
    ( None )
# 827 "lib/parser.ml"
     : (Ast.expression option))

let _menhir_action_50 =
  fun expr ->
    let x = 
# 67 "lib/parser.mly"
                                                  ( expr )
# 835 "lib/parser.ml"
     in
    (
# 114 "<standard.mly>"
    ( Some x )
# 840 "lib/parser.ml"
     : (Ast.expression option))

let _menhir_action_51 =
  fun () ->
    (
# 111 "<standard.mly>"
    ( None )
# 848 "lib/parser.ml"
     : (Ast.expression option))

let _menhir_action_52 =
  fun expr ->
    let x = 
# 81 "lib/parser.mly"
                                                  ( expr )
# 856 "lib/parser.ml"
     in
    (
# 114 "<standard.mly>"
    ( Some x )
# 861 "lib/parser.ml"
     : (Ast.expression option))

let _menhir_action_53 =
  fun () ->
    (
# 111 "<standard.mly>"
    ( None )
# 869 "lib/parser.ml"
     : (Ast.expression option))

let _menhir_action_54 =
  fun x ->
    (
# 114 "<standard.mly>"
    ( Some x )
# 877 "lib/parser.ml"
     : (Ast.expression option))

let _menhir_action_55 =
  fun t ->
    (
# 177 "lib/parser.mly"
            ( t )
# 885 "lib/parser.ml"
     : (Ast.typ))

let _menhir_action_56 =
  fun t ->
    (
# 178 "lib/parser.mly"
                    ( TRef t )
# 893 "lib/parser.ml"
     : (Ast.typ))

let _menhir_action_57 =
  fun t ->
    (
# 179 "lib/parser.mly"
                         ( TRef t )
# 901 "lib/parser.ml"
     : (Ast.typ))

let _menhir_action_58 =
  fun id ->
    (
# 162 "lib/parser.mly"
             ( IDE id )
# 909 "lib/parser.ml"
     : (Ast.expression))

let _menhir_action_59 =
  fun c ->
    (
# 163 "lib/parser.mly"
              ( CONST (int_of_string c) )
# 917 "lib/parser.ml"
     : (Ast.expression))

let _menhir_action_60 =
  fun id xs ->
    let args = 
# 241 "<standard.mly>"
    ( xs )
# 925 "lib/parser.ml"
     in
    (
# 164 "lib/parser.mly"
                                                                       ( CALL (id, args) )
# 930 "lib/parser.ml"
     : (Ast.expression))

let _menhir_action_61 =
  fun e ->
    (
# 165 "lib/parser.mly"
                                   ( e )
# 938 "lib/parser.ml"
     : (Ast.expression))

let _menhir_action_62 =
  fun e ->
    (
# 166 "lib/parser.mly"
                                                        ( STR e )
# 946 "lib/parser.ml"
     : (Ast.expression))

let _menhir_action_63 =
  fun s ->
    (
# 167 "lib/parser.mly"
                                        ( PRINTSTR s )
# 954 "lib/parser.ml"
     : (Ast.expression))

let _menhir_action_64 =
  fun v ->
    (
# 168 "lib/parser.mly"
                                     ( PRINTVAR v )
# 962 "lib/parser.ml"
     : (Ast.expression))

let _menhir_action_65 =
  fun e ->
    (
# 169 "lib/parser.mly"
                                            ( PRINTEXPR e )
# 970 "lib/parser.ml"
     : (Ast.expression))

let _menhir_action_66 =
  fun id s ->
    (
# 170 "lib/parser.mly"
                                                  ( PUSHSTR(id, s) )
# 978 "lib/parser.ml"
     : (Ast.expression))

let _menhir_action_67 =
  fun e ->
    (
# 121 "lib/parser.mly"
                   ( e )
# 986 "lib/parser.ml"
     : (Ast.expression))

let _menhir_action_68 =
  fun id init ->
    let x = 
# 68 "lib/parser.mly"
      ( 
        match init with 
          | Some expr -> VARDECL_INIT (Immutable, id, expr) 
          | None      -> EMPTY
      )
# 998 "lib/parser.ml"
     in
    (
# 250 "<standard.mly>"
    ( [ x ] )
# 1003 "lib/parser.ml"
     : (Ast.program list))

let _menhir_action_69 =
  fun id init xs ->
    let x = 
# 68 "lib/parser.mly"
      ( 
        match init with 
          | Some expr -> VARDECL_INIT (Immutable, id, expr) 
          | None      -> EMPTY
      )
# 1015 "lib/parser.ml"
     in
    (
# 253 "<standard.mly>"
    ( x :: xs )
# 1020 "lib/parser.ml"
     : (Ast.program list))

let _menhir_action_70 =
  fun id init ->
    let x = 
# 82 "lib/parser.mly"
      ( 
        match init with 
          | Some expr -> VARDECL_INIT (Mutable, id, expr) 
          | None      -> EMPTY
      )
# 1032 "lib/parser.ml"
     in
    (
# 250 "<standard.mly>"
    ( [ x ] )
# 1037 "lib/parser.ml"
     : (Ast.program list))

let _menhir_action_71 =
  fun id init xs ->
    let x = 
# 82 "lib/parser.mly"
      ( 
        match init with 
          | Some expr -> VARDECL_INIT (Mutable, id, expr) 
          | None      -> EMPTY
      )
# 1049 "lib/parser.ml"
     in
    (
# 253 "<standard.mly>"
    ( x :: xs )
# 1054 "lib/parser.ml"
     : (Ast.program list))

let _menhir_action_72 =
  fun x ->
    (
# 250 "<standard.mly>"
    ( [ x ] )
# 1062 "lib/parser.ml"
     : (Ast.expression list))

let _menhir_action_73 =
  fun x xs ->
    (
# 253 "<standard.mly>"
    ( x :: xs )
# 1070 "lib/parser.ml"
     : (Ast.expression list))

let _menhir_action_74 =
  fun x ->
    (
# 250 "<standard.mly>"
    ( [ x ] )
# 1078 "lib/parser.ml"
     : (Ast.parameters))

let _menhir_action_75 =
  fun x xs ->
    (
# 253 "<standard.mly>"
    ( x :: xs )
# 1086 "lib/parser.ml"
     : (Ast.parameters))

let _menhir_action_76 =
  fun () ->
    (
# 173 "lib/parser.mly"
        ( TI32 )
# 1094 "lib/parser.ml"
     : (Ast.typ))

let _menhir_action_77 =
  fun () ->
    (
# 174 "lib/parser.mly"
            ( TString )
# 1102 "lib/parser.ml"
     : (Ast.typ))

let _menhir_action_78 =
  fun e ->
    (
# 157 "lib/parser.mly"
                             ( UNARY_EXPR(BORROW, e) )
# 1110 "lib/parser.ml"
     : (Ast.expression))

let _menhir_action_79 =
  fun e ->
    (
# 158 "lib/parser.mly"
                                  ( UNARY_EXPR(BORROW_MUT, e) )
# 1118 "lib/parser.ml"
     : (Ast.expression))

let _menhir_action_80 =
  fun e ->
    (
# 159 "lib/parser.mly"
                     ( e )
# 1126 "lib/parser.ml"
     : (Ast.expression))

let _menhir_print_token : token -> string =
  fun _tok ->
    match _tok with
    | ADD ->
        "ADD"
    | AND ->
        "AND"
    | ARROW ->
        "ARROW"
    | ASSIGNMENT ->
        "ASSIGNMENT"
    | BORROW ->
        "BORROW"
    | BREAK ->
        "BREAK"
    | COL ->
        "COL"
    | COMMA ->
        "COMMA"
    | CONST _ ->
        "CONST"
    | DIV ->
        "DIV"
    | ELSE ->
        "ELSE"
    | EOF ->
        "EOF"
    | EQ ->
        "EQ"
    | FN ->
        "FN"
    | FROM ->
        "FROM"
    | GEQ ->
        "GEQ"
    | GT ->
        "GT"
    | I32 ->
        "I32"
    | IF ->
        "IF"
    | LBRACE ->
        "LBRACE"
    | LEQ ->
        "LEQ"
    | LET ->
        "LET"
    | LOOP ->
        "LOOP"
    | LPAREN ->
        "LPAREN"
    | LT ->
        "LT"
    | MOD ->
        "MOD"
    | MUL ->
        "MUL"
    | MUT ->
        "MUT"
    | NEQ ->
        "NEQ"
    | OR ->
        "OR"
    | PRINTLN ->
        "PRINTLN"
    | PUSHSTR ->
        "PUSHSTR"
    | RBRACE ->
        "RBRACE"
    | RPAREN ->
        "RPAREN"
    | SEMICOLON ->
        "SEMICOLON"
    | STRING _ ->
        "STRING"
    | SUB ->
        "SUB"
    | TSTRING ->
        "TSTRING"
    | VAR _ ->
        "VAR"

let _menhir_fail : unit -> 'a =
  fun () ->
    Printf.eprintf "Internal failure -- please contact the parser generator's developers.\n%!";
    assert false

include struct
  
  [@@@ocaml.warning "-4-37"]
  
  let _menhir_run_147 : type  ttv_stack. ttv_stack -> _ -> _menhir_box_main =
    fun _menhir_stack _v ->
      let def = _v in
      let _v = _menhir_action_48 def in
      MenhirBox_main _v
  
  let rec _menhir_run_151 : type  ttv_stack. (ttv_stack, _menhir_box_main) _menhir_cell1_definition -> _ -> _menhir_box_main =
    fun _menhir_stack _v ->
      let MenhirCell1_definition (_menhir_stack, _menhir_s, x) = _menhir_stack in
      let xs = _v in
      let _v = _menhir_action_41 x xs in
      _menhir_goto_list_definition_ _menhir_stack _v _menhir_s
  
  and _menhir_goto_list_definition_ : type  ttv_stack. ttv_stack -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _v _menhir_s ->
      match _menhir_s with
      | MenhirState150 ->
          _menhir_run_151 _menhir_stack _v
      | MenhirState000 ->
          _menhir_run_147 _menhir_stack _v
      | _ ->
          _menhir_fail ()
  
  let rec _menhir_run_001 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_LET (_menhir_stack, _menhir_s) in
      let _menhir_s = MenhirState001 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | VAR _v ->
          _menhir_run_002 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | MUT ->
          let _menhir_stack = MenhirCell1_MUT (_menhir_stack, _menhir_s) in
          let _menhir_s = MenhirState135 in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | VAR _v ->
              _menhir_run_136 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_002 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      let _menhir_stack = MenhirCell1_VAR (_menhir_stack, _menhir_s, _v) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | ASSIGNMENT ->
          let _menhir_s = MenhirState003 in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | VAR _v ->
              _menhir_run_004 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | TSTRING ->
              _menhir_run_010 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | PRINTLN ->
              _menhir_run_017 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | LPAREN ->
              _menhir_run_022 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | LBRACE ->
              _menhir_run_023 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | CONST _v ->
              _menhir_run_030 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | BORROW ->
              _menhir_run_031 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | _ ->
              _eRR ())
      | COMMA | SEMICOLON ->
          let _v = _menhir_action_49 () in
          _menhir_goto_option___anonymous_0_ _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_004 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | PUSHSTR ->
          let _menhir_stack = MenhirCell1_VAR (_menhir_stack, _menhir_s, _v) in
          _menhir_run_005 _menhir_stack _menhir_lexbuf _menhir_lexer
      | LPAREN ->
          let _menhir_stack = MenhirCell1_VAR (_menhir_stack, _menhir_s, _v) in
          _menhir_run_009 _menhir_stack _menhir_lexbuf _menhir_lexer
      | ASSIGNMENT ->
          let _menhir_stack = MenhirCell1_VAR (_menhir_stack, _menhir_s, _v) in
          _menhir_run_021 _menhir_stack _menhir_lexbuf _menhir_lexer
      | ADD | AND | BORROW | BREAK | COMMA | CONST _ | DIV | ELSE | EQ | FN | GEQ | GT | IF | LBRACE | LEQ | LET | LOOP | LT | MOD | MUL | NEQ | OR | PRINTLN | RBRACE | RPAREN | SEMICOLON | SUB | TSTRING | VAR _ ->
          let id = _v in
          let _v = _menhir_action_58 id in
          _menhir_goto_primary_expr _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_005 : type  ttv_stack. (ttv_stack, _menhir_box_main) _menhir_cell1_VAR -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | LPAREN ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | STRING _v ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              (match (_tok : MenhirBasics.token) with
              | RPAREN ->
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  let MenhirCell1_VAR (_menhir_stack, _menhir_s, id) = _menhir_stack in
                  let s = _v in
                  let _v = _menhir_action_66 id s in
                  _menhir_goto_primary_expr _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
              | _ ->
                  _eRR ())
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_goto_primary_expr : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState137 ->
          _menhir_run_037 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState003 ->
          _menhir_run_037 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState129 ->
          _menhir_run_037 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState009 ->
          _menhir_run_037 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState018 ->
          _menhir_run_037 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState021 ->
          _menhir_run_037 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState022 ->
          _menhir_run_037 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState117 ->
          _menhir_run_037 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState024 ->
          _menhir_run_037 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState026 ->
          _menhir_run_037 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState112 ->
          _menhir_run_037 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState028 ->
          _menhir_run_037 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState110 ->
          _menhir_run_037 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState038 ->
          _menhir_run_037 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState093 ->
          _menhir_run_037 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState091 ->
          _menhir_run_037 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState089 ->
          _menhir_run_037 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState087 ->
          _menhir_run_037 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState085 ->
          _menhir_run_037 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState083 ->
          _menhir_run_037 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState081 ->
          _menhir_run_037 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState079 ->
          _menhir_run_037 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState077 ->
          _menhir_run_037 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState075 ->
          _menhir_run_037 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState073 ->
          _menhir_run_037 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState071 ->
          _menhir_run_037 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState069 ->
          _menhir_run_037 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState067 ->
          _menhir_run_037 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState060 ->
          _menhir_run_037 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState056 ->
          _menhir_run_037 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState029 ->
          _menhir_run_037 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState031 ->
          _menhir_run_035 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState033 ->
          _menhir_run_034 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_037 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let e = _v in
      let _v = _menhir_action_80 e in
      _menhir_goto_unary_expr _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_goto_unary_expr : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let u = _v in
      let _v = _menhir_action_01 u in
      _menhir_goto_binary_expr _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_goto_binary_expr : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState091 ->
          _menhir_run_092 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState089 ->
          _menhir_run_090 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState087 ->
          _menhir_run_088 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState085 ->
          _menhir_run_086 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState083 ->
          _menhir_run_084 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState081 ->
          _menhir_run_082 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState079 ->
          _menhir_run_080 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState077 ->
          _menhir_run_078 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState075 ->
          _menhir_run_076 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState073 ->
          _menhir_run_074 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState071 ->
          _menhir_run_072 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState069 ->
          _menhir_run_070 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState067 ->
          _menhir_run_068 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState137 ->
          _menhir_run_066 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState003 ->
          _menhir_run_066 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState009 ->
          _menhir_run_066 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState129 ->
          _menhir_run_066 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState018 ->
          _menhir_run_066 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState021 ->
          _menhir_run_066 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState022 ->
          _menhir_run_066 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState024 ->
          _menhir_run_066 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState117 ->
          _menhir_run_066 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState026 ->
          _menhir_run_066 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState028 ->
          _menhir_run_066 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState112 ->
          _menhir_run_066 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState029 ->
          _menhir_run_066 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState038 ->
          _menhir_run_066 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState110 ->
          _menhir_run_066 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState056 ->
          _menhir_run_066 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState093 ->
          _menhir_run_066 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState060 ->
          _menhir_run_066 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_092 : type  ttv_stack. ((ttv_stack, _menhir_box_main) _menhir_cell1_binary_expr as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | SUB ->
          let _menhir_stack = MenhirCell1_binary_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer
      | NEQ ->
          let _menhir_stack = MenhirCell1_binary_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_077 _menhir_stack _menhir_lexbuf _menhir_lexer
      | MUL ->
          let _menhir_stack = MenhirCell1_binary_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_069 _menhir_stack _menhir_lexbuf _menhir_lexer
      | MOD ->
          let _menhir_stack = MenhirCell1_binary_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_071 _menhir_stack _menhir_lexbuf _menhir_lexer
      | LT ->
          let _menhir_stack = MenhirCell1_binary_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_079 _menhir_stack _menhir_lexbuf _menhir_lexer
      | LEQ ->
          let _menhir_stack = MenhirCell1_binary_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_083 _menhir_stack _menhir_lexbuf _menhir_lexer
      | GT ->
          let _menhir_stack = MenhirCell1_binary_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_085 _menhir_stack _menhir_lexbuf _menhir_lexer
      | GEQ ->
          let _menhir_stack = MenhirCell1_binary_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_087 _menhir_stack _menhir_lexbuf _menhir_lexer
      | EQ ->
          let _menhir_stack = MenhirCell1_binary_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_089 _menhir_stack _menhir_lexbuf _menhir_lexer
      | DIV ->
          let _menhir_stack = MenhirCell1_binary_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_073 _menhir_stack _menhir_lexbuf _menhir_lexer
      | ADD ->
          let _menhir_stack = MenhirCell1_binary_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_081 _menhir_stack _menhir_lexbuf _menhir_lexer
      | AND | BORROW | BREAK | COMMA | CONST _ | ELSE | FN | IF | LBRACE | LET | LOOP | LPAREN | OR | PRINTLN | RBRACE | RPAREN | SEMICOLON | TSTRING | VAR _ ->
          let MenhirCell1_binary_expr (_menhir_stack, _menhir_s, e1) = _menhir_stack in
          let e2 = _v in
          let _v = _menhir_action_08 e1 e2 in
          _menhir_goto_binary_expr _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_067 : type  ttv_stack. (ttv_stack, _menhir_box_main) _menhir_cell1_binary_expr -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _menhir_s = MenhirState067 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | VAR _v ->
          _menhir_run_032 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | TSTRING ->
          _menhir_run_010 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | PRINTLN ->
          _menhir_run_017 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LPAREN ->
          _menhir_run_022 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | CONST _v ->
          _menhir_run_030 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | BORROW ->
          _menhir_run_031 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_032 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | PUSHSTR ->
          let _menhir_stack = MenhirCell1_VAR (_menhir_stack, _menhir_s, _v) in
          _menhir_run_005 _menhir_stack _menhir_lexbuf _menhir_lexer
      | LPAREN ->
          let _menhir_stack = MenhirCell1_VAR (_menhir_stack, _menhir_s, _v) in
          _menhir_run_009 _menhir_stack _menhir_lexbuf _menhir_lexer
      | ADD | AND | BORROW | BREAK | COMMA | CONST _ | DIV | ELSE | EQ | FN | GEQ | GT | IF | LBRACE | LEQ | LET | LOOP | LT | MOD | MUL | NEQ | OR | PRINTLN | RBRACE | RPAREN | SEMICOLON | SUB | TSTRING | VAR _ ->
          let id = _v in
          let _v = _menhir_action_58 id in
          _menhir_goto_primary_expr _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_009 : type  ttv_stack. (ttv_stack, _menhir_box_main) _menhir_cell1_VAR -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _menhir_s = MenhirState009 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | VAR _v ->
          _menhir_run_004 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | TSTRING ->
          _menhir_run_010 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | PRINTLN ->
          _menhir_run_017 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LPAREN ->
          _menhir_run_022 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LBRACE ->
          _menhir_run_023 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | CONST _v ->
          _menhir_run_030 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | BORROW ->
          _menhir_run_031 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | RPAREN ->
          let _v = _menhir_action_44 () in
          _menhir_goto_loption_separated_nonempty_list_COMMA_expression__ _menhir_stack _menhir_lexbuf _menhir_lexer _v
      | _ ->
          _eRR ()
  
  and _menhir_run_010 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | COL ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | COL ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              (match (_tok : MenhirBasics.token) with
              | FROM ->
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  (match (_tok : MenhirBasics.token) with
                  | LPAREN ->
                      let _tok = _menhir_lexer _menhir_lexbuf in
                      (match (_tok : MenhirBasics.token) with
                      | STRING _v ->
                          let _tok = _menhir_lexer _menhir_lexbuf in
                          (match (_tok : MenhirBasics.token) with
                          | RPAREN ->
                              let _tok = _menhir_lexer _menhir_lexbuf in
                              let e = _v in
                              let _v = _menhir_action_62 e in
                              _menhir_goto_primary_expr _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
                          | _ ->
                              _eRR ())
                      | _ ->
                          _eRR ())
                  | _ ->
                      _eRR ())
              | _ ->
                  _eRR ())
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_017 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | LPAREN ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | VAR _v ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              (match (_tok : MenhirBasics.token) with
              | RPAREN ->
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  let v = _v in
                  let _v = _menhir_action_64 v in
                  _menhir_goto_primary_expr _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
              | PUSHSTR ->
                  let _menhir_stack = MenhirCell1_PRINTLN (_menhir_stack, _menhir_s) in
                  let _menhir_stack = MenhirCell1_VAR (_menhir_stack, MenhirState018, _v) in
                  _menhir_run_005 _menhir_stack _menhir_lexbuf _menhir_lexer
              | LPAREN ->
                  let _menhir_stack = MenhirCell1_PRINTLN (_menhir_stack, _menhir_s) in
                  let _menhir_stack = MenhirCell1_VAR (_menhir_stack, MenhirState018, _v) in
                  _menhir_run_009 _menhir_stack _menhir_lexbuf _menhir_lexer
              | ASSIGNMENT ->
                  let _menhir_stack = MenhirCell1_PRINTLN (_menhir_stack, _menhir_s) in
                  let _menhir_stack = MenhirCell1_VAR (_menhir_stack, MenhirState018, _v) in
                  _menhir_run_021 _menhir_stack _menhir_lexbuf _menhir_lexer
              | ADD | AND | DIV | EQ | GEQ | GT | LEQ | LT | MOD | MUL | NEQ | OR | SUB ->
                  let _menhir_stack = MenhirCell1_PRINTLN (_menhir_stack, _menhir_s) in
                  let _v =
                    let id = _v in
                    _menhir_action_58 id
                  in
                  _menhir_run_037 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState018 _tok
              | _ ->
                  _eRR ())
          | TSTRING ->
              let _menhir_stack = MenhirCell1_PRINTLN (_menhir_stack, _menhir_s) in
              _menhir_run_010 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState018
          | STRING _v ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              (match (_tok : MenhirBasics.token) with
              | RPAREN ->
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  let s = _v in
                  let _v = _menhir_action_63 s in
                  _menhir_goto_primary_expr _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
              | _ ->
                  _eRR ())
          | PRINTLN ->
              let _menhir_stack = MenhirCell1_PRINTLN (_menhir_stack, _menhir_s) in
              _menhir_run_017 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState018
          | LPAREN ->
              let _menhir_stack = MenhirCell1_PRINTLN (_menhir_stack, _menhir_s) in
              _menhir_run_022 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState018
          | LBRACE ->
              let _menhir_stack = MenhirCell1_PRINTLN (_menhir_stack, _menhir_s) in
              _menhir_run_023 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState018
          | CONST _v ->
              let _menhir_stack = MenhirCell1_PRINTLN (_menhir_stack, _menhir_s) in
              _menhir_run_030 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState018
          | BORROW ->
              let _menhir_stack = MenhirCell1_PRINTLN (_menhir_stack, _menhir_s) in
              _menhir_run_031 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState018
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_021 : type  ttv_stack. (ttv_stack, _menhir_box_main) _menhir_cell1_VAR -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _menhir_s = MenhirState021 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | VAR _v ->
          _menhir_run_004 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | TSTRING ->
          _menhir_run_010 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | PRINTLN ->
          _menhir_run_017 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LPAREN ->
          _menhir_run_022 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LBRACE ->
          _menhir_run_023 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | CONST _v ->
          _menhir_run_030 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | BORROW ->
          _menhir_run_031 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_022 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_LPAREN (_menhir_stack, _menhir_s) in
      let _menhir_s = MenhirState022 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | VAR _v ->
          _menhir_run_004 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | TSTRING ->
          _menhir_run_010 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | PRINTLN ->
          _menhir_run_017 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LPAREN ->
          _menhir_run_022 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LBRACE ->
          _menhir_run_023 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | CONST _v ->
          _menhir_run_030 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | BORROW ->
          _menhir_run_031 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_023 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_LBRACE (_menhir_stack, _menhir_s) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | LET ->
          _menhir_run_001 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState023
      | BORROW | BREAK | CONST _ | FN | IF | LBRACE | LOOP | LPAREN | PRINTLN | RBRACE | SEMICOLON | TSTRING | VAR _ ->
          let _v = _menhir_action_38 () in
          _menhir_run_024 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState023 _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_024 : type  ttv_stack. ((ttv_stack, _menhir_box_main) _menhir_cell1_LBRACE as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_list_declaration_ (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | VAR _v_0 ->
          _menhir_run_004 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0 MenhirState024
      | TSTRING ->
          _menhir_run_010 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState024
      | SEMICOLON ->
          _menhir_run_025 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState024
      | PRINTLN ->
          _menhir_run_017 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState024
      | LPAREN ->
          _menhir_run_022 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState024
      | LOOP ->
          _menhir_run_026 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState024
      | LBRACE ->
          _menhir_run_027 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState024
      | IF ->
          _menhir_run_029 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState024
      | FN ->
          _menhir_run_039 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState024
      | CONST _v_1 ->
          _menhir_run_030 _menhir_stack _menhir_lexbuf _menhir_lexer _v_1 MenhirState024
      | BREAK ->
          _menhir_run_057 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState024
      | BORROW ->
          _menhir_run_031 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState024
      | RBRACE ->
          let _v_2 = _menhir_action_42 () in
          _menhir_run_117 _menhir_stack _menhir_lexbuf _menhir_lexer _v_2 MenhirState024 _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_025 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      let _v = _menhir_action_28 () in
      _menhir_goto_instruction _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_goto_instruction : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState026 ->
          _menhir_run_116 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState110 ->
          _menhir_run_111 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState038 ->
          _menhir_run_109 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState024 ->
          _menhir_run_093 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState028 ->
          _menhir_run_093 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState093 ->
          _menhir_run_093 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState056 ->
          _menhir_run_093 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_116 : type  ttv_stack. (ttv_stack, _menhir_box_main) _menhir_cell1_LOOP -> _ -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_LOOP (_menhir_stack, _menhir_s) = _menhir_stack in
      let ins = _v in
      let _v = _menhir_action_34 ins in
      _menhir_goto_instruction _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_111 : type  ttv_stack. (((ttv_stack, _menhir_box_main) _menhir_cell1_IF, _menhir_box_main) _menhir_cell1_expression, _menhir_box_main) _menhir_cell1_instruction -> _ -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_instruction (_menhir_stack, _, ins1) = _menhir_stack in
      let MenhirCell1_expression (_menhir_stack, _, cond) = _menhir_stack in
      let MenhirCell1_IF (_menhir_stack, _menhir_s) = _menhir_stack in
      let ins2 = _v in
      let _v = _menhir_action_33 cond ins1 ins2 in
      _menhir_goto_instruction _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_109 : type  ttv_stack. (((ttv_stack, _menhir_box_main) _menhir_cell1_IF, _menhir_box_main) _menhir_cell1_expression as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | ELSE ->
          let _menhir_stack = MenhirCell1_instruction (_menhir_stack, _menhir_s, _v) in
          let _menhir_s = MenhirState110 in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | VAR _v ->
              _menhir_run_004 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | TSTRING ->
              _menhir_run_010 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | SEMICOLON ->
              _menhir_run_025 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | PRINTLN ->
              _menhir_run_017 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | LPAREN ->
              _menhir_run_022 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | LOOP ->
              _menhir_run_026 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | LET ->
              _menhir_run_001 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | LBRACE ->
              _menhir_run_027 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | IF ->
              _menhir_run_029 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | FN ->
              _menhir_run_039 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | CONST _v ->
              _menhir_run_030 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | BREAK ->
              _menhir_run_057 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | BORROW ->
              _menhir_run_031 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | _ ->
              _eRR ())
      | BORROW | BREAK | CONST _ | FN | IF | LBRACE | LET | LOOP | LPAREN | PRINTLN | RBRACE | SEMICOLON | TSTRING | VAR _ ->
          let MenhirCell1_expression (_menhir_stack, _, cond) = _menhir_stack in
          let MenhirCell1_IF (_menhir_stack, _menhir_s) = _menhir_stack in
          let ins = _v in
          let _v = _menhir_action_32 cond ins in
          _menhir_goto_instruction _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_026 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_LOOP (_menhir_stack, _menhir_s) in
      let _menhir_s = MenhirState026 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | VAR _v ->
          _menhir_run_004 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | TSTRING ->
          _menhir_run_010 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | SEMICOLON ->
          _menhir_run_025 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | PRINTLN ->
          _menhir_run_017 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LPAREN ->
          _menhir_run_022 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LOOP ->
          _menhir_run_026 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LET ->
          _menhir_run_001 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LBRACE ->
          _menhir_run_027 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | IF ->
          _menhir_run_029 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | FN ->
          _menhir_run_039 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | CONST _v ->
          _menhir_run_030 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | BREAK ->
          _menhir_run_057 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | BORROW ->
          _menhir_run_031 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_027 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_LBRACE (_menhir_stack, _menhir_s) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | LET ->
          _menhir_run_001 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState027
      | BORROW | BREAK | CONST _ | FN | IF | LBRACE | LOOP | LPAREN | PRINTLN | RBRACE | SEMICOLON | TSTRING | VAR _ ->
          let _v = _menhir_action_38 () in
          _menhir_run_028 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState027 _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_028 : type  ttv_stack. ((ttv_stack, _menhir_box_main) _menhir_cell1_LBRACE as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_list_declaration_ (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | VAR _v_0 ->
          _menhir_run_004 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0 MenhirState028
      | TSTRING ->
          _menhir_run_010 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState028
      | SEMICOLON ->
          _menhir_run_025 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState028
      | PRINTLN ->
          _menhir_run_017 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState028
      | LPAREN ->
          _menhir_run_022 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState028
      | LOOP ->
          _menhir_run_026 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState028
      | LBRACE ->
          _menhir_run_027 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState028
      | IF ->
          _menhir_run_029 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState028
      | FN ->
          _menhir_run_039 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState028
      | CONST _v_1 ->
          _menhir_run_030 _menhir_stack _menhir_lexbuf _menhir_lexer _v_1 MenhirState028
      | BREAK ->
          _menhir_run_057 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState028
      | BORROW ->
          _menhir_run_031 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState028
      | RBRACE ->
          let _v_2 = _menhir_action_42 () in
          _menhir_run_112 _menhir_stack _menhir_lexbuf _menhir_lexer _v_2
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_029 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_IF (_menhir_stack, _menhir_s) in
      let _menhir_s = MenhirState029 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | VAR _v ->
          _menhir_run_004 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | TSTRING ->
          _menhir_run_010 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | PRINTLN ->
          _menhir_run_017 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LPAREN ->
          _menhir_run_022 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LBRACE ->
          _menhir_run_023 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | CONST _v ->
          _menhir_run_030 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | BORROW ->
          _menhir_run_031 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_030 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      let c = _v in
      let _v = _menhir_action_59 c in
      _menhir_goto_primary_expr _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_031 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_BORROW (_menhir_stack, _menhir_s) in
      let _menhir_s = MenhirState031 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | VAR _v ->
          _menhir_run_032 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | TSTRING ->
          _menhir_run_010 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | PRINTLN ->
          _menhir_run_017 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | MUT ->
          let _menhir_stack = MenhirCell1_MUT (_menhir_stack, _menhir_s) in
          let _menhir_s = MenhirState033 in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | VAR _v ->
              _menhir_run_032 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | TSTRING ->
              _menhir_run_010 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | PRINTLN ->
              _menhir_run_017 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | LPAREN ->
              _menhir_run_022 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | CONST _v ->
              _menhir_run_030 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | _ ->
              _eRR ())
      | LPAREN ->
          _menhir_run_022 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | CONST _v ->
          _menhir_run_030 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_039 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_FN (_menhir_stack, _menhir_s) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | VAR _v ->
          let _menhir_stack = MenhirCell0_VAR (_menhir_stack, _v) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | LPAREN ->
              let _menhir_s = MenhirState041 in
              let _tok = _menhir_lexer _menhir_lexbuf in
              (match (_tok : MenhirBasics.token) with
              | VAR _v ->
                  _menhir_run_042 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
              | RPAREN ->
                  let _v = _menhir_action_46 () in
                  _menhir_goto_loption_separated_nonempty_list_COMMA_fpar__ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
              | _ ->
                  _eRR ())
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_042 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      let _menhir_stack = MenhirCell1_VAR (_menhir_stack, _menhir_s, _v) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | COL ->
          let _menhir_s = MenhirState043 in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | TSTRING ->
              _menhir_run_044 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | I32 ->
              _menhir_run_045 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | BORROW ->
              let _menhir_stack = MenhirCell1_BORROW (_menhir_stack, _menhir_s) in
              let _menhir_s = MenhirState046 in
              let _tok = _menhir_lexer _menhir_lexbuf in
              (match (_tok : MenhirBasics.token) with
              | TSTRING ->
                  _menhir_run_044 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | MUT ->
                  let _menhir_stack = MenhirCell1_MUT (_menhir_stack, _menhir_s) in
                  let _menhir_s = MenhirState047 in
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  (match (_tok : MenhirBasics.token) with
                  | TSTRING ->
                      _menhir_run_044 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
                  | I32 ->
                      _menhir_run_045 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
                  | _ ->
                      _eRR ())
              | I32 ->
                  _menhir_run_045 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | _ ->
                  _eRR ())
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_044 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      let _v = _menhir_action_77 () in
      _menhir_goto_typ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_goto_typ : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState102 ->
          _menhir_run_103 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState043 ->
          _menhir_run_050 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState046 ->
          _menhir_run_049 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState047 ->
          _menhir_run_048 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_103 : type  ttv_stack. ((((ttv_stack, _menhir_box_main) _menhir_cell1_FN _menhir_cell0_VAR, _menhir_box_main) _menhir_cell1_loption_separated_nonempty_list_COMMA_fpar__, _menhir_box_main) _menhir_cell1_ARROW as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_typ (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | LBRACE ->
          _menhir_run_055 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState103
      | _ ->
          _eRR ()
  
  and _menhir_run_055 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_LBRACE (_menhir_stack, _menhir_s) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | LET ->
          _menhir_run_001 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState055
      | BORROW | BREAK | CONST _ | FN | IF | LBRACE | LOOP | LPAREN | PRINTLN | RBRACE | SEMICOLON | TSTRING | VAR _ ->
          let _v = _menhir_action_38 () in
          _menhir_run_056 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState055 _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_056 : type  ttv_stack. ((ttv_stack, _menhir_box_main) _menhir_cell1_LBRACE as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_list_declaration_ (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | VAR _v_0 ->
          _menhir_run_004 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0 MenhirState056
      | TSTRING ->
          _menhir_run_010 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState056
      | SEMICOLON ->
          _menhir_run_025 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState056
      | PRINTLN ->
          _menhir_run_017 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState056
      | LPAREN ->
          _menhir_run_022 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState056
      | LOOP ->
          _menhir_run_026 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState056
      | LBRACE ->
          _menhir_run_027 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState056
      | IF ->
          _menhir_run_029 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState056
      | FN ->
          _menhir_run_039 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState056
      | CONST _v_1 ->
          _menhir_run_030 _menhir_stack _menhir_lexbuf _menhir_lexer _v_1 MenhirState056
      | BREAK ->
          _menhir_run_057 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState056
      | BORROW ->
          _menhir_run_031 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState056
      | RBRACE ->
          let _v_2 = _menhir_action_42 () in
          _menhir_run_060 _menhir_stack _menhir_lexbuf _menhir_lexer _v_2 MenhirState056 _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_057 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | SEMICOLON ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_29 () in
          _menhir_goto_instruction _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_060 : type  ttv_stack. (((ttv_stack, _menhir_box_main) _menhir_cell1_LBRACE, _menhir_box_main) _menhir_cell1_list_declaration_ as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_list_instruction_ (_menhir_stack, _menhir_s, _v) in
      let _v_2 = _menhir_action_53 () in
      _menhir_run_062 _menhir_stack _menhir_lexbuf _menhir_lexer _v_2 _tok
  
  and _menhir_run_062 : type  ttv_stack. (((ttv_stack, _menhir_box_main) _menhir_cell1_LBRACE, _menhir_box_main) _menhir_cell1_list_declaration_, _menhir_box_main) _menhir_cell1_list_instruction_ -> _ -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      match (_tok : MenhirBasics.token) with
      | RBRACE ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let MenhirCell1_list_instruction_ (_menhir_stack, _, ins) = _menhir_stack in
          let MenhirCell1_list_declaration_ (_menhir_stack, _, decl) = _menhir_stack in
          let MenhirCell1_LBRACE (_menhir_stack, _menhir_s) = _menhir_stack in
          let opt_ret = _v in
          let _v = _menhir_action_17 decl ins opt_ret in
          _menhir_goto_compound_statement_function _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_goto_compound_statement_function : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState054 ->
          _menhir_run_105 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState103 ->
          _menhir_run_104 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_105 : type  ttv_stack. ((ttv_stack, _menhir_box_main) _menhir_cell1_FN _menhir_cell0_VAR, _menhir_box_main) _menhir_cell1_loption_separated_nonempty_list_COMMA_fpar__ -> _ -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_loption_separated_nonempty_list_COMMA_fpar__ (_menhir_stack, _, xs) = _menhir_stack in
      let MenhirCell0_VAR (_menhir_stack, id) = _menhir_stack in
      let MenhirCell1_FN (_menhir_stack, _menhir_s) = _menhir_stack in
      let ins = _v in
      let _v = _menhir_action_26 id ins xs in
      _menhir_goto_function_definition _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_goto_function_definition : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState150 ->
          _menhir_run_149 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState000 ->
          _menhir_run_149 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState024 ->
          _menhir_run_095 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState026 ->
          _menhir_run_095 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState028 ->
          _menhir_run_095 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState038 ->
          _menhir_run_095 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState110 ->
          _menhir_run_095 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState056 ->
          _menhir_run_095 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState093 ->
          _menhir_run_095 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_149 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let func = _v in
      let _v = _menhir_action_21 func in
      _menhir_goto_definition _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_goto_definition : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_definition (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | LET ->
          _menhir_run_001 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState150
      | FN ->
          _menhir_run_039 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState150
      | EOF ->
          let _v_0 = _menhir_action_40 () in
          _menhir_run_151 _menhir_stack _v_0
      | _ ->
          _eRR ()
  
  and _menhir_run_095 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let func = _v in
      let _v = _menhir_action_36 func in
      _menhir_goto_instruction _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_104 : type  ttv_stack. ((((ttv_stack, _menhir_box_main) _menhir_cell1_FN _menhir_cell0_VAR, _menhir_box_main) _menhir_cell1_loption_separated_nonempty_list_COMMA_fpar__, _menhir_box_main) _menhir_cell1_ARROW, _menhir_box_main) _menhir_cell1_typ -> _ -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_typ (_menhir_stack, _, typ) = _menhir_stack in
      let MenhirCell1_ARROW (_menhir_stack, _) = _menhir_stack in
      let MenhirCell1_loption_separated_nonempty_list_COMMA_fpar__ (_menhir_stack, _, xs) = _menhir_stack in
      let MenhirCell0_VAR (_menhir_stack, id) = _menhir_stack in
      let MenhirCell1_FN (_menhir_stack, _menhir_s) = _menhir_stack in
      let ins = _v in
      let _v = _menhir_action_27 id ins typ xs in
      _menhir_goto_function_definition _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_050 : type  ttv_stack. (ttv_stack, _menhir_box_main) _menhir_cell1_VAR -> _ -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let t = _v in
      let _v = _menhir_action_55 t in
      _menhir_goto_par_type _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
  
  and _menhir_goto_par_type : type  ttv_stack. (ttv_stack, _menhir_box_main) _menhir_cell1_VAR -> _ -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_VAR (_menhir_stack, _menhir_s, id) = _menhir_stack in
      let t = _v in
      let _v = _menhir_action_25 id t in
      match (_tok : MenhirBasics.token) with
      | COMMA ->
          let _menhir_stack = MenhirCell1_fpar (_menhir_stack, _menhir_s, _v) in
          let _menhir_s = MenhirState107 in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | VAR _v ->
              _menhir_run_042 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | _ ->
              _eRR ())
      | RPAREN ->
          let x = _v in
          let _v = _menhir_action_74 x in
          _menhir_goto_separated_nonempty_list_COMMA_fpar_ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_goto_separated_nonempty_list_COMMA_fpar_ : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      match _menhir_s with
      | MenhirState107 ->
          _menhir_run_108 _menhir_stack _menhir_lexbuf _menhir_lexer _v
      | MenhirState041 ->
          _menhir_run_052 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_108 : type  ttv_stack. (ttv_stack, _menhir_box_main) _menhir_cell1_fpar -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
      let MenhirCell1_fpar (_menhir_stack, _menhir_s, x) = _menhir_stack in
      let xs = _v in
      let _v = _menhir_action_75 x xs in
      _menhir_goto_separated_nonempty_list_COMMA_fpar_ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
  
  and _menhir_run_052 : type  ttv_stack. ((ttv_stack, _menhir_box_main) _menhir_cell1_FN _menhir_cell0_VAR as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      let x = _v in
      let _v = _menhir_action_47 x in
      _menhir_goto_loption_separated_nonempty_list_COMMA_fpar__ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
  
  and _menhir_goto_loption_separated_nonempty_list_COMMA_fpar__ : type  ttv_stack. ((ttv_stack, _menhir_box_main) _menhir_cell1_FN _menhir_cell0_VAR as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      let _menhir_stack = MenhirCell1_loption_separated_nonempty_list_COMMA_fpar__ (_menhir_stack, _menhir_s, _v) in
      let _menhir_s = MenhirState054 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | LBRACE ->
          _menhir_run_055 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | ARROW ->
          let _menhir_stack = MenhirCell1_ARROW (_menhir_stack, _menhir_s) in
          let _menhir_s = MenhirState102 in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | TSTRING ->
              _menhir_run_044 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | I32 ->
              _menhir_run_045 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_045 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      let _v = _menhir_action_76 () in
      _menhir_goto_typ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_049 : type  ttv_stack. ((ttv_stack, _menhir_box_main) _menhir_cell1_VAR, _menhir_box_main) _menhir_cell1_BORROW -> _ -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_BORROW (_menhir_stack, _) = _menhir_stack in
      let t = _v in
      let _v = _menhir_action_56 t in
      _menhir_goto_par_type _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
  
  and _menhir_run_048 : type  ttv_stack. (((ttv_stack, _menhir_box_main) _menhir_cell1_VAR, _menhir_box_main) _menhir_cell1_BORROW, _menhir_box_main) _menhir_cell1_MUT -> _ -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_MUT (_menhir_stack, _) = _menhir_stack in
      let MenhirCell1_BORROW (_menhir_stack, _) = _menhir_stack in
      let t = _v in
      let _v = _menhir_action_57 t in
      _menhir_goto_par_type _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
  
  and _menhir_run_112 : type  ttv_stack. ((ttv_stack, _menhir_box_main) _menhir_cell1_LBRACE, _menhir_box_main) _menhir_cell1_list_declaration_ -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      let MenhirCell1_list_declaration_ (_menhir_stack, _, decl) = _menhir_stack in
      let MenhirCell1_LBRACE (_menhir_stack, _menhir_s) = _menhir_stack in
      let ins = _v in
      let _v = _menhir_action_16 decl ins in
      let block = _v in
      let _v = _menhir_action_35 block in
      _menhir_goto_instruction _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_093 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_instruction (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | VAR _v_0 ->
          _menhir_run_004 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0 MenhirState093
      | TSTRING ->
          _menhir_run_010 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState093
      | SEMICOLON ->
          _menhir_run_025 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState093
      | PRINTLN ->
          _menhir_run_017 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState093
      | LPAREN ->
          _menhir_run_022 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState093
      | LOOP ->
          _menhir_run_026 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState093
      | LET ->
          _menhir_run_001 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState093
      | LBRACE ->
          _menhir_run_027 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState093
      | IF ->
          _menhir_run_029 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState093
      | FN ->
          _menhir_run_039 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState093
      | CONST _v_1 ->
          _menhir_run_030 _menhir_stack _menhir_lexbuf _menhir_lexer _v_1 MenhirState093
      | BREAK ->
          _menhir_run_057 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState093
      | BORROW ->
          _menhir_run_031 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState093
      | RBRACE ->
          let _v_2 = _menhir_action_42 () in
          _menhir_run_094 _menhir_stack _menhir_lexbuf _menhir_lexer _v_2 _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_094 : type  ttv_stack. (ttv_stack, _menhir_box_main) _menhir_cell1_instruction -> _ -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_instruction (_menhir_stack, _menhir_s, x) = _menhir_stack in
      let xs = _v in
      let _v = _menhir_action_43 x xs in
      _menhir_goto_list_instruction_ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_goto_list_instruction_ : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState024 ->
          _menhir_run_117 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState028 ->
          _menhir_run_112 _menhir_stack _menhir_lexbuf _menhir_lexer _v
      | MenhirState093 ->
          _menhir_run_094 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState056 ->
          _menhir_run_060 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_117 : type  ttv_stack. (((ttv_stack, _menhir_box_main) _menhir_cell1_LBRACE, _menhir_box_main) _menhir_cell1_list_declaration_ as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_list_instruction_ (_menhir_stack, _menhir_s, _v) in
      let _v_2 = _menhir_action_53 () in
      _menhir_run_114 _menhir_stack _menhir_lexbuf _menhir_lexer _v_2 _tok
  
  and _menhir_run_114 : type  ttv_stack. (((ttv_stack, _menhir_box_main) _menhir_cell1_LBRACE, _menhir_box_main) _menhir_cell1_list_declaration_, _menhir_box_main) _menhir_cell1_list_instruction_ -> _ -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      match (_tok : MenhirBasics.token) with
      | RBRACE ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let MenhirCell1_list_instruction_ (_menhir_stack, _, ins) = _menhir_stack in
          let MenhirCell1_list_declaration_ (_menhir_stack, _, decl) = _menhir_stack in
          let MenhirCell1_LBRACE (_menhir_stack, _menhir_s) = _menhir_stack in
          let opt_ret = _v in
          let _v = _menhir_action_15 decl ins opt_ret in
          let block = _v in
          let _v = _menhir_action_24 block in
          _menhir_goto_expression _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_goto_expression : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState137 ->
          _menhir_run_138 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState003 ->
          _menhir_run_131 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState129 ->
          _menhir_run_128 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState009 ->
          _menhir_run_128 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState018 ->
          _menhir_run_123 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState021 ->
          _menhir_run_120 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState022 ->
          _menhir_run_118 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState024 ->
          _menhir_run_096 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState026 ->
          _menhir_run_096 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState028 ->
          _menhir_run_096 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState038 ->
          _menhir_run_096 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState110 ->
          _menhir_run_096 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState056 ->
          _menhir_run_096 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState093 ->
          _menhir_run_096 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState117 ->
          _menhir_run_064 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState112 ->
          _menhir_run_064 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState060 ->
          _menhir_run_064 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState029 ->
          _menhir_run_038 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_138 : type  ttv_stack. (ttv_stack, _menhir_box_main) _menhir_cell1_VAR -> _ -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let expr = _v in
      let _v = _menhir_action_52 expr in
      _menhir_goto_option___anonymous_2_ _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
  
  and _menhir_goto_option___anonymous_2_ : type  ttv_stack. (ttv_stack, _menhir_box_main) _menhir_cell1_VAR -> _ -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      match (_tok : MenhirBasics.token) with
      | COMMA ->
          let _menhir_stack = MenhirCell0_option___anonymous_2_ (_menhir_stack, _v) in
          let _menhir_s = MenhirState140 in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | VAR _v ->
              _menhir_run_136 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | _ ->
              _eRR ())
      | SEMICOLON ->
          let MenhirCell1_VAR (_menhir_stack, _menhir_s, id) = _menhir_stack in
          let init = _v in
          let _v = _menhir_action_70 id init in
          _menhir_goto_separated_nonempty_list_COMMA___anonymous_3_ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_136 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      let _menhir_stack = MenhirCell1_VAR (_menhir_stack, _menhir_s, _v) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | ASSIGNMENT ->
          let _menhir_s = MenhirState137 in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | VAR _v ->
              _menhir_run_004 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | TSTRING ->
              _menhir_run_010 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | PRINTLN ->
              _menhir_run_017 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | LPAREN ->
              _menhir_run_022 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | LBRACE ->
              _menhir_run_023 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | CONST _v ->
              _menhir_run_030 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | BORROW ->
              _menhir_run_031 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | _ ->
              _eRR ())
      | COMMA | SEMICOLON ->
          let _v = _menhir_action_51 () in
          _menhir_goto_option___anonymous_2_ _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | _ ->
          _eRR ()
  
  and _menhir_goto_separated_nonempty_list_COMMA___anonymous_3_ : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      match _menhir_s with
      | MenhirState135 ->
          _menhir_run_142 _menhir_stack _menhir_lexbuf _menhir_lexer _v
      | MenhirState140 ->
          _menhir_run_141 _menhir_stack _menhir_lexbuf _menhir_lexer _v
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_142 : type  ttv_stack. ((ttv_stack, _menhir_box_main) _menhir_cell1_LET, _menhir_box_main) _menhir_cell1_MUT -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      let MenhirCell1_MUT (_menhir_stack, _) = _menhir_stack in
      let MenhirCell1_LET (_menhir_stack, _menhir_s) = _menhir_stack in
      let decl = _v in
      let _v = _menhir_action_19 decl in
      _menhir_goto_declaration _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_goto_declaration : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState000 ->
          _menhir_run_152 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState150 ->
          _menhir_run_152 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState023 ->
          _menhir_run_100 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState027 ->
          _menhir_run_100 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState100 ->
          _menhir_run_100 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState055 ->
          _menhir_run_100 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState024 ->
          _menhir_run_098 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState026 ->
          _menhir_run_098 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState028 ->
          _menhir_run_098 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState038 ->
          _menhir_run_098 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState110 ->
          _menhir_run_098 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState056 ->
          _menhir_run_098 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState093 ->
          _menhir_run_098 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_152 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let decl = _v in
      let _v = _menhir_action_20 decl in
      _menhir_goto_definition _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_100 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_declaration (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | LET ->
          _menhir_run_001 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState100
      | BORROW | BREAK | CONST _ | FN | IF | LBRACE | LOOP | LPAREN | PRINTLN | RBRACE | SEMICOLON | TSTRING | VAR _ ->
          let _v_0 = _menhir_action_38 () in
          _menhir_run_101 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0 _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_101 : type  ttv_stack. (ttv_stack, _menhir_box_main) _menhir_cell1_declaration -> _ -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_declaration (_menhir_stack, _menhir_s, x) = _menhir_stack in
      let xs = _v in
      let _v = _menhir_action_39 x xs in
      _menhir_goto_list_declaration_ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_goto_list_declaration_ : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState100 ->
          _menhir_run_101 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState055 ->
          _menhir_run_056 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState027 ->
          _menhir_run_028 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState023 ->
          _menhir_run_024 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_098 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let decl = _v in
      let _v = _menhir_action_37 decl in
      _menhir_goto_instruction _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_141 : type  ttv_stack. (ttv_stack, _menhir_box_main) _menhir_cell1_VAR _menhir_cell0_option___anonymous_2_ -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
      let MenhirCell0_option___anonymous_2_ (_menhir_stack, init) = _menhir_stack in
      let MenhirCell1_VAR (_menhir_stack, _menhir_s, id) = _menhir_stack in
      let xs = _v in
      let _v = _menhir_action_71 id init xs in
      _menhir_goto_separated_nonempty_list_COMMA___anonymous_3_ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
  
  and _menhir_run_131 : type  ttv_stack. (ttv_stack, _menhir_box_main) _menhir_cell1_VAR -> _ -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let expr = _v in
      let _v = _menhir_action_50 expr in
      _menhir_goto_option___anonymous_0_ _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
  
  and _menhir_goto_option___anonymous_0_ : type  ttv_stack. (ttv_stack, _menhir_box_main) _menhir_cell1_VAR -> _ -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      match (_tok : MenhirBasics.token) with
      | COMMA ->
          let _menhir_stack = MenhirCell0_option___anonymous_0_ (_menhir_stack, _v) in
          let _menhir_s = MenhirState133 in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | VAR _v ->
              _menhir_run_002 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | _ ->
              _eRR ())
      | SEMICOLON ->
          let MenhirCell1_VAR (_menhir_stack, _menhir_s, id) = _menhir_stack in
          let init = _v in
          let _v = _menhir_action_68 id init in
          _menhir_goto_separated_nonempty_list_COMMA___anonymous_1_ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_goto_separated_nonempty_list_COMMA___anonymous_1_ : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      match _menhir_s with
      | MenhirState001 ->
          _menhir_run_144 _menhir_stack _menhir_lexbuf _menhir_lexer _v
      | MenhirState133 ->
          _menhir_run_134 _menhir_stack _menhir_lexbuf _menhir_lexer _v
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_144 : type  ttv_stack. (ttv_stack, _menhir_box_main) _menhir_cell1_LET -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      let MenhirCell1_LET (_menhir_stack, _menhir_s) = _menhir_stack in
      let decl = _v in
      let _v = _menhir_action_18 decl in
      _menhir_goto_declaration _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_134 : type  ttv_stack. (ttv_stack, _menhir_box_main) _menhir_cell1_VAR _menhir_cell0_option___anonymous_0_ -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
      let MenhirCell0_option___anonymous_0_ (_menhir_stack, init) = _menhir_stack in
      let MenhirCell1_VAR (_menhir_stack, _menhir_s, id) = _menhir_stack in
      let xs = _v in
      let _v = _menhir_action_69 id init xs in
      _menhir_goto_separated_nonempty_list_COMMA___anonymous_1_ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
  
  and _menhir_run_128 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | COMMA ->
          let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v) in
          let _menhir_s = MenhirState129 in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | VAR _v ->
              _menhir_run_004 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | TSTRING ->
              _menhir_run_010 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | PRINTLN ->
              _menhir_run_017 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | LPAREN ->
              _menhir_run_022 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | LBRACE ->
              _menhir_run_023 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | CONST _v ->
              _menhir_run_030 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | BORROW ->
              _menhir_run_031 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | _ ->
              _eRR ())
      | RPAREN ->
          let x = _v in
          let _v = _menhir_action_72 x in
          _menhir_goto_separated_nonempty_list_COMMA_expression_ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_goto_separated_nonempty_list_COMMA_expression_ : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      match _menhir_s with
      | MenhirState129 ->
          _menhir_run_130 _menhir_stack _menhir_lexbuf _menhir_lexer _v
      | MenhirState009 ->
          _menhir_run_125 _menhir_stack _menhir_lexbuf _menhir_lexer _v
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_130 : type  ttv_stack. (ttv_stack, _menhir_box_main) _menhir_cell1_expression -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
      let MenhirCell1_expression (_menhir_stack, _menhir_s, x) = _menhir_stack in
      let xs = _v in
      let _v = _menhir_action_73 x xs in
      _menhir_goto_separated_nonempty_list_COMMA_expression_ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
  
  and _menhir_run_125 : type  ttv_stack. (ttv_stack, _menhir_box_main) _menhir_cell1_VAR -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
      let x = _v in
      let _v = _menhir_action_45 x in
      _menhir_goto_loption_separated_nonempty_list_COMMA_expression__ _menhir_stack _menhir_lexbuf _menhir_lexer _v
  
  and _menhir_goto_loption_separated_nonempty_list_COMMA_expression__ : type  ttv_stack. (ttv_stack, _menhir_box_main) _menhir_cell1_VAR -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      let MenhirCell1_VAR (_menhir_stack, _menhir_s, id) = _menhir_stack in
      let xs = _v in
      let _v = _menhir_action_60 id xs in
      _menhir_goto_primary_expr _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_123 : type  ttv_stack. (ttv_stack, _menhir_box_main) _menhir_cell1_PRINTLN -> _ -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      match (_tok : MenhirBasics.token) with
      | RPAREN ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let MenhirCell1_PRINTLN (_menhir_stack, _menhir_s) = _menhir_stack in
          let e = _v in
          let _v = _menhir_action_65 e in
          _menhir_goto_primary_expr _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_120 : type  ttv_stack. (ttv_stack, _menhir_box_main) _menhir_cell1_VAR -> _ -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_VAR (_menhir_stack, _menhir_s, id) = _menhir_stack in
      let e = _v in
      let _v = _menhir_action_22 e id in
      _menhir_goto_expression _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_118 : type  ttv_stack. (ttv_stack, _menhir_box_main) _menhir_cell1_LPAREN -> _ -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      match (_tok : MenhirBasics.token) with
      | RPAREN ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let MenhirCell1_LPAREN (_menhir_stack, _menhir_s) = _menhir_stack in
          let e = _v in
          let _v = _menhir_action_61 e in
          _menhir_goto_primary_expr _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_096 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | SEMICOLON ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let expr = _v in
          let _v = _menhir_action_30 expr in
          _menhir_goto_instruction _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | BORROW | BREAK | CONST _ | ELSE | FN | IF | LBRACE | LET | LOOP | LPAREN | PRINTLN | RBRACE | TSTRING | VAR _ ->
          let e = _v in
          let _v = _menhir_action_67 e in
          _menhir_goto_return_expression _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_goto_return_expression : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState117 ->
          _menhir_run_061 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState112 ->
          _menhir_run_061 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState060 ->
          _menhir_run_061 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState024 ->
          _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState026 ->
          _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState028 ->
          _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState110 ->
          _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState038 ->
          _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState093 ->
          _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState056 ->
          _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_061 : type  ttv_stack. ((((ttv_stack, _menhir_box_main) _menhir_cell1_LBRACE, _menhir_box_main) _menhir_cell1_list_declaration_, _menhir_box_main) _menhir_cell1_list_instruction_ as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let x = _v in
      let _v = _menhir_action_54 x in
      _menhir_goto_option_return_expression_ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_goto_option_return_expression_ : type  ttv_stack. ((((ttv_stack, _menhir_box_main) _menhir_cell1_LBRACE, _menhir_box_main) _menhir_cell1_list_declaration_, _menhir_box_main) _menhir_cell1_list_instruction_ as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState117 ->
          _menhir_run_114 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState112 ->
          _menhir_run_114 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState060 ->
          _menhir_run_062 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_059 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let expr = _v in
      let _v = _menhir_action_31 expr in
      _menhir_goto_instruction _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_064 : type  ttv_stack. ((((ttv_stack, _menhir_box_main) _menhir_cell1_LBRACE, _menhir_box_main) _menhir_cell1_list_declaration_, _menhir_box_main) _menhir_cell1_list_instruction_ as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let e = _v in
      let _v = _menhir_action_67 e in
      _menhir_goto_return_expression _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_038 : type  ttv_stack. ((ttv_stack, _menhir_box_main) _menhir_cell1_IF as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | VAR _v_0 ->
          _menhir_run_004 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0 MenhirState038
      | TSTRING ->
          _menhir_run_010 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState038
      | SEMICOLON ->
          _menhir_run_025 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState038
      | PRINTLN ->
          _menhir_run_017 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState038
      | LPAREN ->
          _menhir_run_022 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState038
      | LOOP ->
          _menhir_run_026 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState038
      | LET ->
          _menhir_run_001 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState038
      | LBRACE ->
          _menhir_run_027 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState038
      | IF ->
          _menhir_run_029 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState038
      | FN ->
          _menhir_run_039 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState038
      | CONST _v_1 ->
          _menhir_run_030 _menhir_stack _menhir_lexbuf _menhir_lexer _v_1 MenhirState038
      | BREAK ->
          _menhir_run_057 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState038
      | BORROW ->
          _menhir_run_031 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState038
      | _ ->
          _eRR ()
  
  and _menhir_run_077 : type  ttv_stack. (ttv_stack, _menhir_box_main) _menhir_cell1_binary_expr -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _menhir_s = MenhirState077 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | VAR _v ->
          _menhir_run_032 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | TSTRING ->
          _menhir_run_010 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | PRINTLN ->
          _menhir_run_017 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LPAREN ->
          _menhir_run_022 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | CONST _v ->
          _menhir_run_030 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | BORROW ->
          _menhir_run_031 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_069 : type  ttv_stack. (ttv_stack, _menhir_box_main) _menhir_cell1_binary_expr -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _menhir_s = MenhirState069 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | VAR _v ->
          _menhir_run_032 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | TSTRING ->
          _menhir_run_010 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | PRINTLN ->
          _menhir_run_017 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LPAREN ->
          _menhir_run_022 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | CONST _v ->
          _menhir_run_030 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | BORROW ->
          _menhir_run_031 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_071 : type  ttv_stack. (ttv_stack, _menhir_box_main) _menhir_cell1_binary_expr -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _menhir_s = MenhirState071 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | VAR _v ->
          _menhir_run_032 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | TSTRING ->
          _menhir_run_010 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | PRINTLN ->
          _menhir_run_017 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LPAREN ->
          _menhir_run_022 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | CONST _v ->
          _menhir_run_030 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | BORROW ->
          _menhir_run_031 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_079 : type  ttv_stack. (ttv_stack, _menhir_box_main) _menhir_cell1_binary_expr -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _menhir_s = MenhirState079 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | VAR _v ->
          _menhir_run_032 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | TSTRING ->
          _menhir_run_010 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | PRINTLN ->
          _menhir_run_017 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LPAREN ->
          _menhir_run_022 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | CONST _v ->
          _menhir_run_030 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | BORROW ->
          _menhir_run_031 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_083 : type  ttv_stack. (ttv_stack, _menhir_box_main) _menhir_cell1_binary_expr -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _menhir_s = MenhirState083 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | VAR _v ->
          _menhir_run_032 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | TSTRING ->
          _menhir_run_010 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | PRINTLN ->
          _menhir_run_017 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LPAREN ->
          _menhir_run_022 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | CONST _v ->
          _menhir_run_030 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | BORROW ->
          _menhir_run_031 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_085 : type  ttv_stack. (ttv_stack, _menhir_box_main) _menhir_cell1_binary_expr -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _menhir_s = MenhirState085 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | VAR _v ->
          _menhir_run_032 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | TSTRING ->
          _menhir_run_010 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | PRINTLN ->
          _menhir_run_017 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LPAREN ->
          _menhir_run_022 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | CONST _v ->
          _menhir_run_030 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | BORROW ->
          _menhir_run_031 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_087 : type  ttv_stack. (ttv_stack, _menhir_box_main) _menhir_cell1_binary_expr -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _menhir_s = MenhirState087 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | VAR _v ->
          _menhir_run_032 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | TSTRING ->
          _menhir_run_010 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | PRINTLN ->
          _menhir_run_017 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LPAREN ->
          _menhir_run_022 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | CONST _v ->
          _menhir_run_030 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | BORROW ->
          _menhir_run_031 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_089 : type  ttv_stack. (ttv_stack, _menhir_box_main) _menhir_cell1_binary_expr -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _menhir_s = MenhirState089 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | VAR _v ->
          _menhir_run_032 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | TSTRING ->
          _menhir_run_010 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | PRINTLN ->
          _menhir_run_017 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LPAREN ->
          _menhir_run_022 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | CONST _v ->
          _menhir_run_030 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | BORROW ->
          _menhir_run_031 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_073 : type  ttv_stack. (ttv_stack, _menhir_box_main) _menhir_cell1_binary_expr -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _menhir_s = MenhirState073 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | VAR _v ->
          _menhir_run_032 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | TSTRING ->
          _menhir_run_010 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | PRINTLN ->
          _menhir_run_017 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LPAREN ->
          _menhir_run_022 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | CONST _v ->
          _menhir_run_030 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | BORROW ->
          _menhir_run_031 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_081 : type  ttv_stack. (ttv_stack, _menhir_box_main) _menhir_cell1_binary_expr -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _menhir_s = MenhirState081 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | VAR _v ->
          _menhir_run_032 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | TSTRING ->
          _menhir_run_010 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | PRINTLN ->
          _menhir_run_017 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LPAREN ->
          _menhir_run_022 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | CONST _v ->
          _menhir_run_030 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | BORROW ->
          _menhir_run_031 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_090 : type  ttv_stack. ((ttv_stack, _menhir_box_main) _menhir_cell1_binary_expr as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | SUB ->
          let _menhir_stack = MenhirCell1_binary_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer
      | MUL ->
          let _menhir_stack = MenhirCell1_binary_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_069 _menhir_stack _menhir_lexbuf _menhir_lexer
      | MOD ->
          let _menhir_stack = MenhirCell1_binary_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_071 _menhir_stack _menhir_lexbuf _menhir_lexer
      | LT ->
          let _menhir_stack = MenhirCell1_binary_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_079 _menhir_stack _menhir_lexbuf _menhir_lexer
      | LEQ ->
          let _menhir_stack = MenhirCell1_binary_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_083 _menhir_stack _menhir_lexbuf _menhir_lexer
      | GT ->
          let _menhir_stack = MenhirCell1_binary_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_085 _menhir_stack _menhir_lexbuf _menhir_lexer
      | GEQ ->
          let _menhir_stack = MenhirCell1_binary_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_087 _menhir_stack _menhir_lexbuf _menhir_lexer
      | DIV ->
          let _menhir_stack = MenhirCell1_binary_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_073 _menhir_stack _menhir_lexbuf _menhir_lexer
      | ADD ->
          let _menhir_stack = MenhirCell1_binary_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_081 _menhir_stack _menhir_lexbuf _menhir_lexer
      | AND | BORROW | BREAK | COMMA | CONST _ | ELSE | EQ | FN | IF | LBRACE | LET | LOOP | LPAREN | NEQ | OR | PRINTLN | RBRACE | RPAREN | SEMICOLON | TSTRING | VAR _ ->
          let MenhirCell1_binary_expr (_menhir_stack, _menhir_s, e1) = _menhir_stack in
          let e2 = _v in
          let _v = _menhir_action_02 e1 e2 in
          _menhir_goto_binary_expr _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_088 : type  ttv_stack. ((ttv_stack, _menhir_box_main) _menhir_cell1_binary_expr as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | SUB ->
          let _menhir_stack = MenhirCell1_binary_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer
      | MUL ->
          let _menhir_stack = MenhirCell1_binary_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_069 _menhir_stack _menhir_lexbuf _menhir_lexer
      | MOD ->
          let _menhir_stack = MenhirCell1_binary_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_071 _menhir_stack _menhir_lexbuf _menhir_lexer
      | DIV ->
          let _menhir_stack = MenhirCell1_binary_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_073 _menhir_stack _menhir_lexbuf _menhir_lexer
      | ADD ->
          let _menhir_stack = MenhirCell1_binary_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_081 _menhir_stack _menhir_lexbuf _menhir_lexer
      | AND | BORROW | BREAK | COMMA | CONST _ | ELSE | EQ | FN | GEQ | GT | IF | LBRACE | LEQ | LET | LOOP | LPAREN | LT | NEQ | OR | PRINTLN | RBRACE | RPAREN | SEMICOLON | TSTRING | VAR _ ->
          let MenhirCell1_binary_expr (_menhir_stack, _menhir_s, e1) = _menhir_stack in
          let e2 = _v in
          let _v = _menhir_action_06 e1 e2 in
          _menhir_goto_binary_expr _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_086 : type  ttv_stack. ((ttv_stack, _menhir_box_main) _menhir_cell1_binary_expr as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | SUB ->
          let _menhir_stack = MenhirCell1_binary_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer
      | MUL ->
          let _menhir_stack = MenhirCell1_binary_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_069 _menhir_stack _menhir_lexbuf _menhir_lexer
      | MOD ->
          let _menhir_stack = MenhirCell1_binary_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_071 _menhir_stack _menhir_lexbuf _menhir_lexer
      | DIV ->
          let _menhir_stack = MenhirCell1_binary_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_073 _menhir_stack _menhir_lexbuf _menhir_lexer
      | ADD ->
          let _menhir_stack = MenhirCell1_binary_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_081 _menhir_stack _menhir_lexbuf _menhir_lexer
      | AND | BORROW | BREAK | COMMA | CONST _ | ELSE | EQ | FN | GEQ | GT | IF | LBRACE | LEQ | LET | LOOP | LPAREN | LT | NEQ | OR | PRINTLN | RBRACE | RPAREN | SEMICOLON | TSTRING | VAR _ ->
          let MenhirCell1_binary_expr (_menhir_stack, _menhir_s, e1) = _menhir_stack in
          let e2 = _v in
          let _v = _menhir_action_04 e1 e2 in
          _menhir_goto_binary_expr _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_084 : type  ttv_stack. ((ttv_stack, _menhir_box_main) _menhir_cell1_binary_expr as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | SUB ->
          let _menhir_stack = MenhirCell1_binary_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer
      | MUL ->
          let _menhir_stack = MenhirCell1_binary_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_069 _menhir_stack _menhir_lexbuf _menhir_lexer
      | MOD ->
          let _menhir_stack = MenhirCell1_binary_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_071 _menhir_stack _menhir_lexbuf _menhir_lexer
      | DIV ->
          let _menhir_stack = MenhirCell1_binary_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_073 _menhir_stack _menhir_lexbuf _menhir_lexer
      | ADD ->
          let _menhir_stack = MenhirCell1_binary_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_081 _menhir_stack _menhir_lexbuf _menhir_lexer
      | AND | BORROW | BREAK | COMMA | CONST _ | ELSE | EQ | FN | GEQ | GT | IF | LBRACE | LEQ | LET | LOOP | LPAREN | LT | NEQ | OR | PRINTLN | RBRACE | RPAREN | SEMICOLON | TSTRING | VAR _ ->
          let MenhirCell1_binary_expr (_menhir_stack, _menhir_s, e1) = _menhir_stack in
          let e2 = _v in
          let _v = _menhir_action_07 e1 e2 in
          _menhir_goto_binary_expr _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_082 : type  ttv_stack. ((ttv_stack, _menhir_box_main) _menhir_cell1_binary_expr as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | MUL ->
          let _menhir_stack = MenhirCell1_binary_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_069 _menhir_stack _menhir_lexbuf _menhir_lexer
      | MOD ->
          let _menhir_stack = MenhirCell1_binary_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_071 _menhir_stack _menhir_lexbuf _menhir_lexer
      | DIV ->
          let _menhir_stack = MenhirCell1_binary_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_073 _menhir_stack _menhir_lexbuf _menhir_lexer
      | ADD | AND | BORROW | BREAK | COMMA | CONST _ | ELSE | EQ | FN | GEQ | GT | IF | LBRACE | LEQ | LET | LOOP | LPAREN | LT | NEQ | OR | PRINTLN | RBRACE | RPAREN | SEMICOLON | SUB | TSTRING | VAR _ ->
          let MenhirCell1_binary_expr (_menhir_stack, _menhir_s, e1) = _menhir_stack in
          let e2 = _v in
          let _v = _menhir_action_10 e1 e2 in
          _menhir_goto_binary_expr _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_080 : type  ttv_stack. ((ttv_stack, _menhir_box_main) _menhir_cell1_binary_expr as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | SUB ->
          let _menhir_stack = MenhirCell1_binary_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer
      | MUL ->
          let _menhir_stack = MenhirCell1_binary_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_069 _menhir_stack _menhir_lexbuf _menhir_lexer
      | MOD ->
          let _menhir_stack = MenhirCell1_binary_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_071 _menhir_stack _menhir_lexbuf _menhir_lexer
      | DIV ->
          let _menhir_stack = MenhirCell1_binary_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_073 _menhir_stack _menhir_lexbuf _menhir_lexer
      | ADD ->
          let _menhir_stack = MenhirCell1_binary_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_081 _menhir_stack _menhir_lexbuf _menhir_lexer
      | AND | BORROW | BREAK | COMMA | CONST _ | ELSE | EQ | FN | GEQ | GT | IF | LBRACE | LEQ | LET | LOOP | LPAREN | LT | NEQ | OR | PRINTLN | RBRACE | RPAREN | SEMICOLON | TSTRING | VAR _ ->
          let MenhirCell1_binary_expr (_menhir_stack, _menhir_s, e1) = _menhir_stack in
          let e2 = _v in
          let _v = _menhir_action_05 e1 e2 in
          _menhir_goto_binary_expr _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_078 : type  ttv_stack. ((ttv_stack, _menhir_box_main) _menhir_cell1_binary_expr as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | SUB ->
          let _menhir_stack = MenhirCell1_binary_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer
      | MUL ->
          let _menhir_stack = MenhirCell1_binary_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_069 _menhir_stack _menhir_lexbuf _menhir_lexer
      | MOD ->
          let _menhir_stack = MenhirCell1_binary_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_071 _menhir_stack _menhir_lexbuf _menhir_lexer
      | LT ->
          let _menhir_stack = MenhirCell1_binary_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_079 _menhir_stack _menhir_lexbuf _menhir_lexer
      | LEQ ->
          let _menhir_stack = MenhirCell1_binary_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_083 _menhir_stack _menhir_lexbuf _menhir_lexer
      | GT ->
          let _menhir_stack = MenhirCell1_binary_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_085 _menhir_stack _menhir_lexbuf _menhir_lexer
      | GEQ ->
          let _menhir_stack = MenhirCell1_binary_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_087 _menhir_stack _menhir_lexbuf _menhir_lexer
      | DIV ->
          let _menhir_stack = MenhirCell1_binary_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_073 _menhir_stack _menhir_lexbuf _menhir_lexer
      | ADD ->
          let _menhir_stack = MenhirCell1_binary_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_081 _menhir_stack _menhir_lexbuf _menhir_lexer
      | AND | BORROW | BREAK | COMMA | CONST _ | ELSE | EQ | FN | IF | LBRACE | LET | LOOP | LPAREN | NEQ | OR | PRINTLN | RBRACE | RPAREN | SEMICOLON | TSTRING | VAR _ ->
          let MenhirCell1_binary_expr (_menhir_stack, _menhir_s, e1) = _menhir_stack in
          let e2 = _v in
          let _v = _menhir_action_03 e1 e2 in
          _menhir_goto_binary_expr _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_076 : type  ttv_stack. ((ttv_stack, _menhir_box_main) _menhir_cell1_binary_expr as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | SUB ->
          let _menhir_stack = MenhirCell1_binary_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer
      | NEQ ->
          let _menhir_stack = MenhirCell1_binary_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_077 _menhir_stack _menhir_lexbuf _menhir_lexer
      | MUL ->
          let _menhir_stack = MenhirCell1_binary_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_069 _menhir_stack _menhir_lexbuf _menhir_lexer
      | MOD ->
          let _menhir_stack = MenhirCell1_binary_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_071 _menhir_stack _menhir_lexbuf _menhir_lexer
      | LT ->
          let _menhir_stack = MenhirCell1_binary_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_079 _menhir_stack _menhir_lexbuf _menhir_lexer
      | LEQ ->
          let _menhir_stack = MenhirCell1_binary_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_083 _menhir_stack _menhir_lexbuf _menhir_lexer
      | GT ->
          let _menhir_stack = MenhirCell1_binary_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_085 _menhir_stack _menhir_lexbuf _menhir_lexer
      | GEQ ->
          let _menhir_stack = MenhirCell1_binary_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_087 _menhir_stack _menhir_lexbuf _menhir_lexer
      | EQ ->
          let _menhir_stack = MenhirCell1_binary_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_089 _menhir_stack _menhir_lexbuf _menhir_lexer
      | DIV ->
          let _menhir_stack = MenhirCell1_binary_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_073 _menhir_stack _menhir_lexbuf _menhir_lexer
      | AND ->
          let _menhir_stack = MenhirCell1_binary_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_091 _menhir_stack _menhir_lexbuf _menhir_lexer
      | ADD ->
          let _menhir_stack = MenhirCell1_binary_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_081 _menhir_stack _menhir_lexbuf _menhir_lexer
      | BORROW | BREAK | COMMA | CONST _ | ELSE | FN | IF | LBRACE | LET | LOOP | LPAREN | OR | PRINTLN | RBRACE | RPAREN | SEMICOLON | TSTRING | VAR _ ->
          let MenhirCell1_binary_expr (_menhir_stack, _menhir_s, e1) = _menhir_stack in
          let e2 = _v in
          let _v = _menhir_action_09 e1 e2 in
          _menhir_goto_binary_expr _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_091 : type  ttv_stack. (ttv_stack, _menhir_box_main) _menhir_cell1_binary_expr -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _menhir_s = MenhirState091 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | VAR _v ->
          _menhir_run_032 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | TSTRING ->
          _menhir_run_010 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | PRINTLN ->
          _menhir_run_017 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LPAREN ->
          _menhir_run_022 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | CONST _v ->
          _menhir_run_030 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | BORROW ->
          _menhir_run_031 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_074 : type  ttv_stack. (ttv_stack, _menhir_box_main) _menhir_cell1_binary_expr -> _ -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_binary_expr (_menhir_stack, _menhir_s, e1) = _menhir_stack in
      let e2 = _v in
      let _v = _menhir_action_13 e1 e2 in
      _menhir_goto_binary_expr _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_072 : type  ttv_stack. (ttv_stack, _menhir_box_main) _menhir_cell1_binary_expr -> _ -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_binary_expr (_menhir_stack, _menhir_s, e1) = _menhir_stack in
      let e2 = _v in
      let _v = _menhir_action_14 e1 e2 in
      _menhir_goto_binary_expr _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_070 : type  ttv_stack. (ttv_stack, _menhir_box_main) _menhir_cell1_binary_expr -> _ -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_binary_expr (_menhir_stack, _menhir_s, e1) = _menhir_stack in
      let e2 = _v in
      let _v = _menhir_action_12 e1 e2 in
      _menhir_goto_binary_expr _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_068 : type  ttv_stack. ((ttv_stack, _menhir_box_main) _menhir_cell1_binary_expr as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | MUL ->
          let _menhir_stack = MenhirCell1_binary_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_069 _menhir_stack _menhir_lexbuf _menhir_lexer
      | MOD ->
          let _menhir_stack = MenhirCell1_binary_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_071 _menhir_stack _menhir_lexbuf _menhir_lexer
      | DIV ->
          let _menhir_stack = MenhirCell1_binary_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_073 _menhir_stack _menhir_lexbuf _menhir_lexer
      | ADD | AND | BORROW | BREAK | COMMA | CONST _ | ELSE | EQ | FN | GEQ | GT | IF | LBRACE | LEQ | LET | LOOP | LPAREN | LT | NEQ | OR | PRINTLN | RBRACE | RPAREN | SEMICOLON | SUB | TSTRING | VAR _ ->
          let MenhirCell1_binary_expr (_menhir_stack, _menhir_s, e1) = _menhir_stack in
          let e2 = _v in
          let _v = _menhir_action_11 e1 e2 in
          _menhir_goto_binary_expr _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_066 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | SUB ->
          let _menhir_stack = MenhirCell1_binary_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer
      | OR ->
          let _menhir_stack = MenhirCell1_binary_expr (_menhir_stack, _menhir_s, _v) in
          let _menhir_s = MenhirState075 in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | VAR _v ->
              _menhir_run_032 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | TSTRING ->
              _menhir_run_010 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | PRINTLN ->
              _menhir_run_017 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | LPAREN ->
              _menhir_run_022 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | CONST _v ->
              _menhir_run_030 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | BORROW ->
              _menhir_run_031 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | _ ->
              _eRR ())
      | NEQ ->
          let _menhir_stack = MenhirCell1_binary_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_077 _menhir_stack _menhir_lexbuf _menhir_lexer
      | MUL ->
          let _menhir_stack = MenhirCell1_binary_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_069 _menhir_stack _menhir_lexbuf _menhir_lexer
      | MOD ->
          let _menhir_stack = MenhirCell1_binary_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_071 _menhir_stack _menhir_lexbuf _menhir_lexer
      | LT ->
          let _menhir_stack = MenhirCell1_binary_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_079 _menhir_stack _menhir_lexbuf _menhir_lexer
      | LEQ ->
          let _menhir_stack = MenhirCell1_binary_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_083 _menhir_stack _menhir_lexbuf _menhir_lexer
      | GT ->
          let _menhir_stack = MenhirCell1_binary_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_085 _menhir_stack _menhir_lexbuf _menhir_lexer
      | GEQ ->
          let _menhir_stack = MenhirCell1_binary_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_087 _menhir_stack _menhir_lexbuf _menhir_lexer
      | EQ ->
          let _menhir_stack = MenhirCell1_binary_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_089 _menhir_stack _menhir_lexbuf _menhir_lexer
      | DIV ->
          let _menhir_stack = MenhirCell1_binary_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_073 _menhir_stack _menhir_lexbuf _menhir_lexer
      | AND ->
          let _menhir_stack = MenhirCell1_binary_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_091 _menhir_stack _menhir_lexbuf _menhir_lexer
      | ADD ->
          let _menhir_stack = MenhirCell1_binary_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_081 _menhir_stack _menhir_lexbuf _menhir_lexer
      | BORROW | BREAK | COMMA | CONST _ | ELSE | FN | IF | LBRACE | LET | LOOP | LPAREN | PRINTLN | RBRACE | RPAREN | SEMICOLON | TSTRING | VAR _ ->
          let b_expr = _v in
          let _v = _menhir_action_23 b_expr in
          _menhir_goto_expression _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_035 : type  ttv_stack. (ttv_stack, _menhir_box_main) _menhir_cell1_BORROW -> _ -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_BORROW (_menhir_stack, _menhir_s) = _menhir_stack in
      let e = _v in
      let _v = _menhir_action_78 e in
      _menhir_goto_unary_expr _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_034 : type  ttv_stack. ((ttv_stack, _menhir_box_main) _menhir_cell1_BORROW, _menhir_box_main) _menhir_cell1_MUT -> _ -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_MUT (_menhir_stack, _) = _menhir_stack in
      let MenhirCell1_BORROW (_menhir_stack, _menhir_s) = _menhir_stack in
      let e = _v in
      let _v = _menhir_action_79 e in
      _menhir_goto_unary_expr _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  let _menhir_run_000 : type  ttv_stack. ttv_stack -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | LET ->
          _menhir_run_001 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState000
      | FN ->
          _menhir_run_039 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState000
      | EOF ->
          let _v = _menhir_action_40 () in
          _menhir_run_147 _menhir_stack _v
      | _ ->
          _eRR ()
  
end

let main =
  fun _menhir_lexer _menhir_lexbuf ->
    let _menhir_stack = () in
    let MenhirBox_main v = _menhir_run_000 _menhir_stack _menhir_lexbuf _menhir_lexer in
    v
