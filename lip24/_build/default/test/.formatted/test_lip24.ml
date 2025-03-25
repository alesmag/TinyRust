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
  examples_dict tests


[@@ocamlformat "disable"]
