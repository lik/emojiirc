# emojiirc
IRC bot that responds to emoji shortnames (e.g. `:bear:`)

## Dependencies
 - [irc-client](https://github.com/johnelse/ocaml-irc-client)
and others probably

## Functionality
Currently, this bot parses all messages for emoji shortnames and returns the appropriate emoji.

```
<dolan> hi :duck:
<emojiirc> 🦆
<dolan> :D
```

The emoji list in `emoji.ml` follows the [Unicode 10.0.0](http://unicode.org/versions/Unicode10.0.0/) specification, supporting 2666 emoji.

## To Do
 - make functions more efficient
 - add more functionality
   - returns message but with all shortnames converted into emoji, retaining the structure otherwise
   - prevent bot from being spammed
