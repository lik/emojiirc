open Emoji
open Lwt
module C = Irc_client_lwt
module M = Irc_message

let host = ref "irc.rizon.net"
let port = ref 6667
let nick = ref "emojiirc"
let realname = ref "🦆"
let channel = ref "#homescreen"
let message = "🤣🤣🤣"

let string_list_to_string string_list =
  Printf.sprintf "[%s]" (String.concat "; " string_list)

let callback connection result =
  match result with
  | Result.Ok ({M.command=M.Other _ ; _}as msg) ->
    Lwt_io.printf "Got unknown message: %s\n" (M.to_string msg)
    >>= fun () -> Lwt_io.flush Lwt_io.stdout
  | Result.Ok ({M.command=M.PRIVMSG (target, data); _} as msg) ->
    Lwt_io.printf "Got message: %s\n" (M.to_string msg)
    >>= fun () -> Lwt_io.flush Lwt_io.stdout
    >>= fun () -> (match sl_privmsg (String.split_on_char ' ' (String.lowercase_ascii data)) with
                   | "" -> Lwt_io.flush Lwt_io.stdout
                   | _ -> C.send_privmsg ~connection ~target ~message:(sl_privmsg (String.split_on_char ' ' (String.lowercase_ascii data))))
  | Result.Ok msg ->
    Lwt_io.printf "Got message: %s\n" (M.to_string msg)
    >>= fun () -> Lwt_io.flush Lwt_io.stdout
  | Result.Error e ->
    Lwt_io.printl e

let lwt_main =
  C.set_log Lwt_io.printl;
  C.reconnect_loop
    ~after:30
    ~connect:(fun () ->
      Lwt_io.printl "Connecting..." >>= fun () ->
      C.connect_by_name ~server:!host ~port:!port ~username:!nick ~nick:!nick ~realname:!realname ()
    )
    ~f:(fun connection ->
      Lwt_io.printl "Connected" >>= fun () ->
      Lwt_io.printl "send join msg" >>= fun () ->
      C.send_join ~connection ~channel:!channel >>= fun () ->
      C.send_privmsg ~connection ~target:!channel ~message
    )
    ~callback
    ()

let options = Arg.align
  [ "-host", Arg.Set_string host, " set remove server host name"
  ; "-port", Arg.Set_int port, " set remote server port"
  ; "-chan", Arg.Set_string channel, " channel to join"
  ]

let _ =
  Arg.parse options (fun _ -> ()) "example2 [options]";
  Lwt_main.run lwt_main

(* ocamlfind ocamlopt -package irc-client.lwt -linkpkg code.ml *)
