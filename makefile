all: emoji emoji_tests

emoji: emoji.ml
	ocamlbuild emoji.byte

emoji_tests: emoji_tests.ml
	ocamlbuild emoji_tests.byte

clean:
	rm -rf _build *.byte
