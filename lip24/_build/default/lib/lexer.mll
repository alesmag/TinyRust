{
  open Parser
  exception Error of string
}

let white = [' ' '\t' '\n']+
let digit = ['0'-'9']
let id = ['_' 'a'-'z' 'A'-'Z']['_' 'a'-'z' 'A'-'Z' '0'-'9']*
let num = digit+
let comment = "//" [^'\n']* | "/*" ( [^'*'] | '*' [^'/'] )* "*/"
let string = "\"" [^'\"']* "\""

rule read_token = parse
  | white           { read_token lexbuf }
  | comment         { read_token lexbuf }
  | "fn"            { FN }
  | "let"           { LET }
  | "mut"           { MUT }
  | "if"            { IF }
  | "else"          { ELSE }
  | "loop"          { LOOP }
  | "break"         { BREAK }
  | "i32"           { I32 }
  | "String"        { TSTRING }
  | "from"          { FROM }
  | "&"             { BORROW }
  | "{"             { LBRACE }
  | "}"             { RBRACE }
  | "("             { LPAREN }
  | ")"             { RPAREN }
  | ";"             { SEMICOLON }
  | ":"             { COL }
  | "->"            { ARROW }
  | "="             { ASSIGNMENT }
  | "=="            { EQ }
  | "!="            { NEQ }
  | "<="            { LEQ }
  | "<"             { LT }
  | ">="            { GEQ }
  | ">"             { GT }
  | "+"             { ADD }
  | "-"             { SUB }
  | "*"             { MUL }
  | "/"             { DIV }
  | "%"             { MOD }
  | "&&"            { AND }
  | "||"            { OR }
  | "println!"      { PRINTLN }
  | ".push_str"     { PUSHSTR }
  | id              { VAR (Lexing.lexeme lexbuf) }
  | num             { CONST (Lexing.lexeme lexbuf) }
  | string          { 
      let s = Lexing.lexeme lexbuf in
      STRING (String.sub s 1 (String.length s - 2))
    }
  | eof             { EOF }
  | _               { raise (Error ("Unrecognized character: " ^ Lexing.lexeme lexbuf)) }