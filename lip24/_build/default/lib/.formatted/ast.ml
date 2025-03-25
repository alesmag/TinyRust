type identifier = string

type mut = Mutable | Immutable

type typ = TI32 | TString | TRef of typ | TRefMut of typ

type binary_op =
  | ADD
  | SUB
  | MUL
  | DIV
  | MOD
  | EQ
  | NEQ
  | GT
  | LT
  | GEQ
  | LEQ
  | LAND
  | LOR

type parameters = (identifier * typ) list

type unary_op = BORROW | BORROW_MUT

type expression =
  | NIL
  | IDE of identifier
  | STR of string
  | ASSIGN of identifier * expression
  | CALL of identifier * expression list
  | CALL_EXEC of instruction
  | CONST of int
  | UNARY_EXPR of unary_op * expression
  | BINARY_EXPR of expression * binary_op * expression
  | REF of int
  | REF_MUT of int
  | BLOCK_EXPR of instruction
  | PRINTSTR of string
  | PRINTVAR of string
  | PRINTEXPR of expression
  | PUSHSTR of identifier * string

and instruction =
  | EMPTY
  | BREAK
  | IF of expression * instruction
  | IFE of expression * instruction * instruction
  | LOOP of instruction
  | EXPR of expression
  | RET of expression
  | BLOCK of instruction
  | BLOCK_EXEC of instruction
  | VARDECL_INIT of mut * identifier * expression
  | FUNDECL of identifier * parameters * instruction
  | FUNDECL_ARROW of identifier * parameters * instruction * typ
  | SEQ of instruction * instruction

type program = instruction
