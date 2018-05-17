all: emoji emoji_tests code

emoji: emoji.ml
	ocamlbuild emoji.byte

emoji_tests: emoji_tests.ml
	ocamlbuild emoji_tests.byte

code: code.ml
	ocamlbuild -use-ocamlfind -package irc-client.lwt code.byte

clean:
	rm -rf _build *.byte
