open Lip24Lib
open Lip24Lib.Common

(** ------------------------------------------ Start of parser tests
    ------------------------------------------ *)

let%test_unit "test_parser" =
  Array.iter
    (fun ex ->
      let p = read_file ex in
      try
        Main.parse p |> ignore;
        pr "✔ Parsed %s\n" ex
      with _ -> pr "✘ Couldn't parse %s\n" ex)
    examples;
  pr "\n\n"

(** ------------------------------------------ Start of trace tests
    ------------------------------------------ *)

let%expect_test "test_trace" =
Array.iter2
  (fun (name, progr) (_, gas, test) ->
    let progr : Ast.program = Main.parse progr in
    let _, (res : string trace_result) = Trace.trace gas progr in
    let icon =
      match (res, test) with
      | Ok _, Ok _ | Error _, Error _ -> "✔"
      | Ok _, Error _ | Error _, Ok _ -> "✘"
    in

    pr "------------------------\n%s %s\n------------------------\n" icon name;

    let print_result title result =
      match result with
      | Ok output -> pr "%-9s %-9s\n%s\n\n" title "Ok" output
      | Error err -> pr "%-9s %-9s\n%s\n\n" title "Error" (string_of_trace_error err)
    in

    print_result "Output:" res;
    print_result "Expected:" test)
  examples_dict tests;


[@@ocamlformat "disable"]
  [%expect {|
    3
    4
    ------------------------
    ✔ 01-print.rs
    ------------------------
    Output:   Ok


    Expected: Ok
    3
    4


    ------------------------
    ✔ 02-intError.rs
    ------------------------
    Output:   Error
    [CannotMutate] cannot mutate immutable variable x

    Expected: Error
    [CannotMutate] cannot mutate immutable variable x

    7
    ------------------------
    ✔ 03-intOk.rs
    ------------------------
    Output:   Ok


    Expected: Ok
    7


    ------------------------
    ✔ 04-stringError.rs
    ------------------------
    Output:   Error
    [CannotMutate] cannot mutate immutable variable x

    Expected: Error
    [CannotMutate] cannot mutate immutable variable x

    Ciao, mondo
    ------------------------
    ✔ 05-stringOk.rs
    ------------------------
    Output:   Ok


    Expected: Ok
    Ciao, mondo


    6
    3
    ------------------------
    ✔ 06-scopeOk.rs
    ------------------------
    Output:   Ok


    Expected: Ok
    6
    3


    ------------------------
    ✔ 07-scopeError.rs
    ------------------------
    Output:   Error
    [UnboundVar] y not defined in this scope

    Expected: Error
    [UnboundVar] y not defined in this scope

    10
    ------------------------
    ✔ 08-func.rs
    ------------------------
    Output:   Ok


    Expected: Ok
    10


    7
    ------------------------
    ✔ 09-proc.rs
    ------------------------
    Output:   Ok


    Expected: Ok
    7


    dispari
    ------------------------
    ✔ 10-ifThenElse.rs
    ------------------------
    Output:   Ok


    Expected: Ok
    dispari


    ------------------------
    ✔ 11-ownError.rs
    ------------------------
    Output:   Error
    [MovedValue] borrow of moved value x

    Expected: Error
    [MovedValue] borrow of moved value x

    Ciao
    ------------------------
    ✔ 12-ownFnError.rs
    ------------------------
    Output:   Error
    [MovedValue] borrow of moved value x

    Expected: Error
    [MovedValue] borrow of moved value x

    Ciao
    Ciao
    ------------------------
    ✔ 13-borrow.rs
    ------------------------
    Output:   Ok


    Expected: Ok
    Ciao
    Ciao


    il parametro prestato: Ciao
    il parametro x: Ciao
    ------------------------
    ✔ 14-borrowFn.rs
    ------------------------
    Output:   Ok


    Expected: Ok
    il parametro prestato: Ciao
    il parametro x: Ciao


    ------------------------
    ✔ 15-borrowError.rs
    ------------------------
    Output:   Error
    [DataRace] cannot borrow x as mutable because it is also borrowed as immutable

    Expected: Error
    [DataRace] cannot borrow x as mutable because it is also borrowed as immutable

    Ciao, mondo
    Ciao, mondo
    ------------------------
    ✔ 16-borrowMut.rs
    ------------------------
    Output:   Ok


    Expected: Ok
    Ciao, mondo
    Ciao, mondo


    ------------------------
    ✔ 17-borrowMutError.rs
    ------------------------
    Output:   Error
    [MutBorrowOfNonMut] cannot borrow x as mutable, as it is not declared as mutable

    Expected: Error
    [MutBorrowOfNonMut] cannot borrow x as mutable, as it is not declared as mutable

    ------------------------
    ✔ 18-loop.rs
    ------------------------
    Output:   Error
    [OutOfGas] trace run out of gas (0)

    Expected: Error
    [OutOfGas] trace run out of gas (0)

    3
    2
    1
    0
    ------------------------
    ✔ 19-loopBreak.rs
    ------------------------
    Output:   Ok


    Expected: Ok
    3
    2
    1
    0


    0,0
    0,1
    1,0
    1,1
    2,0
    2,1
    ------------------------
    ✔ 20-loopNested.rs
    ------------------------
    Output:   Ok


    Expected: Ok
    0,0
    0,1
    1,0
    1,1
    2,0
    2,1


    7
    ------------------------
    ✔ 21-exprBlock.rs
    ------------------------
    Output:   Ok


    Expected: Ok
    7


    4
    ------------------------
    ✔ 22-funExpr.rs
    ------------------------
    Output:   Error
    [UnboundVar] interna not defined in this scope

    Expected: Error
    [UnboundVar] interna not defined in this scope

    ------------------------
    ✔ 23-scopeCheck.rs
    ------------------------
    Output:   Error
    [UnboundVar] y not defined in this scope

    Expected: Error
    [UnboundVar] y not defined in this scope
    |}]
