open Ast

let pr = Printf.printf
let spr = Printf.sprintf

let examples_dir =
  "/home/alesmag/Nextcloud/UNICA/A3S1/LIP - Linguaggi di \
   Programmazione/tinyrust/lip24/test/examples/"
(* "/workspaces/tinyrust/lip24/test/examples/" *)

let examples =
  let full_name name = examples_dir ^ name in
  let files = Sys.readdir examples_dir in
  Array.sort String.compare files;
  Array.map full_name files

let read_file filename =
  let ch = open_in filename in
  let len = in_channel_length ch in
  let str = really_input_string ch len in
  close_in ch;
  str

(** associative array, mapping filename to content *)
let examples_dict : (string * string) array =
  let examples = Sys.readdir examples_dir in
  Array.sort String.compare examples;
  Array.map (fun e -> (e, read_file (examples_dir ^ e))) examples

type trace_error =
  | TypeError of string
  | UnboundVar of identifier
  | CannotMutate of identifier
  | MovedValue of identifier
  | MutBorrowOfNonMut of identifier
  | DataRace of identifier * mut * mut
  | OutOfGas of int
  | NotInLoop

type 'output trace_result = ('output, trace_error) result
(** ['output] is a type parameter for successful executions *)

let string_of_mut = function
  | Mutable -> "mutable"
  | Immutable -> "immutable"

let string_of_trace_error = function
  | TypeError s ->
      spr "[TypeError] %s" s
  | CannotMutate x ->
      spr "[CannotMutate] cannot mutate immutable variable %s" x
  | UnboundVar x ->
      spr "[UnboundVar] %s not defined in this scope" x
  | MovedValue x ->
      spr "[MovedValue] borrow of moved value %s" x
  | OutOfGas i ->
      spr "[OutOfGas] trace run out of gas (%d)" i
  | NotInLoop ->
    "[NotInLoop] cannot break outside of a loop"
  | MutBorrowOfNonMut x ->
      spr
        "[MutBorrowOfNonMut] cannot borrow %s as mutable, as it is not \
          declared as mutable"
        x
  | DataRace (x, mut1, mut2) ->
      spr "[DataRace] cannot borrow %s as %s because it is also borrowed as %s"
        x (string_of_mut mut1) (string_of_mut mut2)

[@@ocamlformat "disable"]

(** ------------------------------------------ Definition of tests
    ------------------------------------------ *)

let tests : (string * int * string trace_result) array =
  [|
    ("01-print.rs",           25, Ok "3\n4\n");
    ("02-intError.rs",        25, Error (CannotMutate "x"));
    ("03-intOk.rs",           25, Ok "7\n");
    ("04-stringError.rs",     25, Error (CannotMutate "x"));
    ("05-stringOk.rs",        25, Ok "Ciao, mondo\n");
    ("06-scopeOk.rs",         25, Ok "6\n3\n");
    ("07-scopeError.rs",      25, Error (UnboundVar "y"));
    ("08-func.rs",            25, Ok "10\n");
    ("09-proc.rs",            25, Ok "7\n");
    ("10-ifThenElse.rs",      25, Ok "dispari\n");
    ("11-ownError.rs",        25, Error (MovedValue "x"));
    ("12-ownFnError.rs",      25, Error (MovedValue "x"));
    ("13-borrow.rs",          25, Ok "Ciao\nCiao\n");
    ("14-borrowFn.rs",        25, Ok "il parametro prestato: Ciao\nil parametro x: Ciao\n" );
    ("15-borrowError.rs",     25, Error (DataRace ("x", Mutable, Immutable)));
    ("16-borrowMut.rs",       25, Ok "Ciao, mondo\nCiao, mondo\n");
    ("17-borrowMutError.rs",  40, Error (MutBorrowOfNonMut "x"));
    ("18-loop.rs",            0, Error (OutOfGas 0));
    ("19-loopBreak.rs",       50, Ok "3\n2\n1\n0\n");
    ("20-loopNested.rs",      50, Ok "0,0\n0,1\n1,0\n1,1\n2,0\n2,1\n");
    ("21-exprBlock.rs",       25, Ok "7\n");
    ("22-funExpr.rs",         25, Error (UnboundVar "interna"));
    ("23-scopeCheck.rs",      25, Error (UnboundVar "y"));
  |] [@@ocamlformat "disable"]
