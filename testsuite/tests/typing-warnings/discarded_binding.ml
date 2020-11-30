(* TEST
   flags = " -w A -strict-sequence "
   * expect
*)

let f x = x + 1
let _ = f 1;;
[%%expect {|
val f : int -> int = <fun>
Line 2, characters 4-5:
2 | let _ = f 1;;
        ^
Warning 69 [discarded-binding]: A binding of type 'int' was discarded without its type being declared. Either 'ignore' the result or declare the type of the discarded binding '(_:int)'
- : int = 2
|}]

let _ = ();;
[%%expect {|
Line 1, characters 4-5:
1 | let _ = ();;
        ^
Warning 69 [discarded-binding]: A unit binding was discarded. 
Hint: replace '_' with '()'
- : unit = ()     
|}]

let ( let* ) o f =
   match o with
   | None -> None
   | Some x -> f x;;
let* _ = Some 1 in Some (1 + 1);;
[%%expect {|
val ( let* ) : 'a option -> ('a -> 'b option) -> 'b option = <fun>
- : int option = Some 2
|}]