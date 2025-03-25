%{
  open Ast

  let rec seq_of_ins_list = function
    | []              -> EMPTY
    | [ins]           -> ins
    | [ins; ins']     -> SEQ (ins, ins')
    | ins :: ins_list -> SEQ (ins, seq_of_ins_list ins_list)
%}

%token I32 TSTRING
%token <string> VAR
%token <string> CONST
%token <string> STRING
%token EQ NEQ GT LT GEQ LEQ AND OR
%token ADD SUB MUL DIV MOD
%token ASSIGNMENT BREAK FN LET
%token LPAREN RPAREN
%token LBRACE RBRACE
%token IF ELSE LOOP
%token FROM MUT BORROW PRINTLN PUSHSTR
%token COMMA SEMICOLON COL ARROW
%token EOF

%left OR
%left AND
%left EQ NEQ
%left GT LT GEQ LEQ
%left ADD SUB
%left MUL DIV MOD
%nonassoc IFELSE
%nonassoc ELSE

%start <program> main

%type <instruction> definition
%type <instruction> declaration
%type <instruction> function_definition
%type <instruction> compound_statement_function
%type <instruction> compound_statement
%type <expression> block_expr
%type <expression> return_expression
%type <instruction> instruction
%type <expression> expression
%type <expression> binary_expr
%type <expression> unary_expr
%type <expression> primary_expr
%type <typ> typ
%type <typ> par_type
%type <string * typ> fpar

%%

main:
  | def = list(definition); EOF
    { seq_of_ins_list def }

definition:
  | decl = declaration { decl }
  | func = function_definition { func }

declaration:
  | LET; 
    decl = separated_nonempty_list(
      COMMA, 
      id = VAR;
      init = option(ASSIGNMENT; expr = expression { expr })
      { 
        match init with 
          | Some expr -> VARDECL_INIT (Immutable, id, expr) 
          | None      -> EMPTY
      }
    );
    SEMICOLON
    { seq_of_ins_list decl }
  
  | LET; MUT; 
    decl = separated_nonempty_list(
      COMMA, 
      id = VAR;
      init = option(ASSIGNMENT; expr = expression { expr })
      { 
        match init with 
          | Some expr -> VARDECL_INIT (Mutable, id, expr) 
          | None      -> EMPTY
      }
    );
    SEMICOLON
    { seq_of_ins_list decl }

function_definition:
  | FN; id = VAR; LPAREN; params = separated_list(COMMA, fpar); RPAREN;
    ins = compound_statement_function
    { FUNDECL (id, params, ins) }
  | FN; id = VAR; LPAREN; params = separated_list(COMMA, fpar); RPAREN; ARROW; typ = typ; 
    ins = compound_statement_function
    { FUNDECL_ARROW (id, params, ins, typ) }


compound_statement_function:
  | LBRACE; decl = list(declaration); ins = list(instruction); opt_ret = option(return_expression); RBRACE
    { 
      match opt_ret with
      | Some ret -> seq_of_ins_list (decl @ ins @ [RET ret])
      | None -> seq_of_ins_list (decl @ ins)
    }

compound_statement:
  | LBRACE; decl = list(declaration); ins = list(instruction) RBRACE
    { let seq = seq_of_ins_list (decl @ ins) in if seq = EMPTY then EMPTY else BLOCK seq }

block_expr:
  | LBRACE; decl = list(declaration); ins = list(instruction); opt_ret = option(return_expression); RBRACE
    { 
      match opt_ret with
      | Some ret -> BLOCK_EXPR (seq_of_ins_list (decl @ ins @ [RET ret]))
      | None -> BLOCK_EXPR (seq_of_ins_list (decl @ ins))
    }

return_expression:
  | e = expression { e }

instruction:
  | SEMICOLON { EMPTY }
  | BREAK; SEMICOLON { BREAK }
  | expr = expression; SEMICOLON { EXPR expr }
  | expr = return_expression { RET expr }
  | IF; cond = expression; ins = instruction %prec IFELSE { IF (cond, ins) }
  | IF; cond = expression; ins1 = instruction; ELSE; ins2 = instruction { IFE (cond, ins1, ins2) }
  | LOOP; ins = instruction { LOOP (ins) }
  | block = compound_statement { block }
  | func = function_definition { func }
  | decl = declaration { decl }

expression:
  | id = VAR; ASSIGNMENT; e = expression { ASSIGN (id, e) }
  | b_expr = binary_expr { b_expr }
  | block = block_expr { block }

binary_expr:
  | u = unary_expr { u }
  | e1 = binary_expr; EQ; e2 = binary_expr { BINARY_EXPR (e1, EQ, e2) }
  | e1 = binary_expr; NEQ; e2 = binary_expr { BINARY_EXPR (e1, NEQ, e2) }
  | e1 = binary_expr; GT; e2 = binary_expr { BINARY_EXPR (e1, GT, e2) }
  | e1 = binary_expr; LT; e2 = binary_expr { BINARY_EXPR (e1, LT, e2) }
  | e1 = binary_expr; GEQ; e2 = binary_expr { BINARY_EXPR (e1, GEQ, e2) }
  | e1 = binary_expr; LEQ; e2 = binary_expr { BINARY_EXPR (e1, LEQ, e2) }
  | e1 = binary_expr; AND; e2 = binary_expr { BINARY_EXPR (e1, LAND, e2) }
  | e1 = binary_expr; OR; e2 = binary_expr { BINARY_EXPR (e1, LOR, e2) }
  | e1 = binary_expr; ADD; e2 = binary_expr { BINARY_EXPR (e1, ADD, e2) }
  | e1 = binary_expr; SUB; e2 = binary_expr { BINARY_EXPR (e1, SUB, e2) }
  | e1 = binary_expr; MUL; e2 = binary_expr { BINARY_EXPR (e1, MUL, e2) }
  | e1 = binary_expr; DIV; e2 = binary_expr { BINARY_EXPR (e1, DIV, e2) }
  | e1 = binary_expr; MOD; e2 = binary_expr { BINARY_EXPR (e1, MOD, e2) }

unary_expr:
  | BORROW; e = primary_expr { UNARY_EXPR(BORROW, e) }
  | BORROW; MUT; e = primary_expr { UNARY_EXPR(BORROW_MUT, e) }
  | e = primary_expr { e }

primary_expr:
  | id = VAR { IDE id }
  | c = CONST { CONST (int_of_string c) }
  | id = VAR; LPAREN; args = separated_list(COMMA, expression); RPAREN { CALL (id, args) }
  | LPAREN; e = expression; RPAREN { e }
  | TSTRING; COL; COL; FROM; LPAREN; e = STRING; RPAREN { STR e }
  | PRINTLN; LPAREN; s = STRING; RPAREN { PRINTSTR s }
  | PRINTLN; LPAREN; v = VAR; RPAREN { PRINTVAR v }
  | PRINTLN; LPAREN; e = expression; RPAREN { PRINTEXPR e }
  | id = VAR; PUSHSTR; LPAREN; s = STRING; RPAREN { PUSHSTR(id, s) }

typ:
  | I32 { TI32 }
  | TSTRING { TString }

par_type:
  | t = typ { t }
  | BORROW; t = typ { TRef t }
  | BORROW; MUT; t = typ { TRef t }

fpar:
  | id = VAR COL t = par_type { (id, t) }
