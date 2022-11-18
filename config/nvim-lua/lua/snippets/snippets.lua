local ls = require "luasnip"

ls.add_snippets("all", {
    ls.parser.parse_snippet("expand", "-- this is what was expanded"),
    ls.parser.parse_snippet(
      "lspsyn",
      "Wow! This ${1:Stuff} really ${2:works. ${3:Well, a bit.}}"
    )
  }
)

