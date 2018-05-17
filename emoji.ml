module Emojis = Map.Make(String)

let m = Emojis.empty
let m = Emojis.add ":bear:" "🐻" m
let m = Emojis.add ":smirk:" "😏" m

let filter_for_emoji (lst : string list) =
  List.filter (fun x -> Emojis.mem x m) lst

let return_emoji_list (lst : string list) =
  List.map (fun x -> Emojis.find x m) lst

let return_emoji_string (lst : string list) =
  String.concat " " lst

let ye (lst : string list) =
  return_emoji_string (return_emoji_list (filter_for_emoji lst))
