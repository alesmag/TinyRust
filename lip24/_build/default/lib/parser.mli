
(* The type of tokens. *)

type token = 
  | VAR of (string)
  | TSTRING
  | SUB
  | STRING of (string)
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
  | CONST of (string)
  | COMMA
  | COL
  | BREAK
  | BORROW
  | ASSIGNMENT
  | ARROW
  | AND
  | ADD

(* This exception is raised by the monolithic API functions. *)

exception Error

(* The monolithic API. *)

val main: (Lexing.lexbuf -> token) -> Lexing.lexbuf -> (Ast.program)
