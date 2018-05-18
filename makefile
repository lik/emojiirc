all: emoji code

emoji: emoji.ml
	ocamlbuild emoji.byte

code: code.ml
	ocamlbuild -use-ocamlfind -package irc-client.lwt code.byte

clean:
	rm -rf _build *.byte
