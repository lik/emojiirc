open Emoji

let two_emoji = ["hi"; "test"; ":bear:"; ":smirk:"]
let no_emoji = ["lol"; "wolo"]

(* let find_emoji (lst : string list) =
  let find_emoji_helper str =
    match Emojis.find_opt str m with
    | Some x -> Printf.printf "%s " x
    | None -> () 
  in
  List.iter find_emoji_helper lst *)

let _ = assert ((ye two_emoji) = "🐻 😏")
let _ = assert ((Emojis.find ":bear:" m) = "🐻")
