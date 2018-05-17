module Emojis = Map.Make(String)

let m = Emojis.empty

let m = Emojis.add ":bear:" "🐻" m

let m = Emojis.add ":smirk:" "😏" m
