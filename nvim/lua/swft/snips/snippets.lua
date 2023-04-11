local ls = require "luasnip"
local s = ls.snippet
local sn = ls.snippet_node
-- local isn = ls.indent_snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
-- local r = ls.restore_node
-- local events = require "luasnip.util.events"
local ai = require "luasnip.nodes.absolute_indexer"
local extras = require "luasnip.extras"
-- local l = extras.lambda
local rep = extras.rep
-- local p = extras.partial
-- local m = extras.match
-- local n = extras.nonempty
-- local dl = extras.dynamic_lambda
local fmt = require("luasnip.extras.fmt").fmt
-- local fmta = require("luasnip.extras.fmt").fmta
-- local conds = require "luasnip.extras.expand_conditions"
-- local postfix = require("luasnip.extras.postfix").postfix
-- local types = require "luasnip.util.types"
local parse = require("luasnip.util.parser").parse_snippet
-- local ms = ls.multi_snippet
local snippet_collection = require "luasnip.session.snippet_collection"
snippet_collection.clear_snippets "text"
snippet_collection.clear_snippets "lua"
snippet_collection.clear_snippets "scheme"

-- ls.add_snippets("lua", {
--   parse("good", "print('good')", {}),
-- })
--

-- local dyn = function(position)
--   return d(position, function()
--     return sn(nil,)
--   end, {})
-- end

ls.add_snippets("text", {
  s(
    "req",
    fmt([[ local {} = require "{}" ]], {
      f(function(import_name)
        -- print(vim.inspect(import_name))
        local parts = vim.split(import_name[1][1], ".", { plain = true })
        return parts[#parts] or ""
        -- return ""
      end, { 1 }),
      i(1),
    })
  ),

  s(
    "time",
    f(function()
      return os.date "%D %H:%M"
    end)
  ),

  -- End Line
})

ls.add_snippets("scheme", {
  s(
    "df",
    fmt(
      [[
      ;; {}
      ;; {}

      (check-expect ({} {}) {}) ; Tests
      (check-expect ({} {}) {})

      ;; (define ({} {}) {}) ; Stub

      {}

      (define ({} {})
        ({}))
    ]],
      {
        i(1, "Signature"),
        i(2, "Purpose"),
        rep(3),
        i(6, "Test Input"),
        i(7, "Expected Output"),
        rep(3),
        i(8, "Test Input"),
        i(9, "Expected Output"),
        i(3, "Function Name"),
        i(4, "Parameter Name"),
        i(5, "Return Type"),

        c(10, {
          fmt(";; Took template from {}", { i(1, "Data definition") }),
          fmt(
            [[
                ;; (define ({} {}) ; Template
                ;;    (... {})){}
            ]],
            { rep(ai[3]), rep(ai[4]), rep(ai[4]), i(1) }
          ),
        }),

        rep(3),
        rep(4),
        i(0, "Function Body"),
      }
    )
  ),

  s(
    "test-lib",
    fmt(
      [[
          (require test-engine/racket-tests)

          {}

          (test)
      ]],
      { i(0) }
    )
  ),

  s("racket", t "#lang racket"),

  -- Last Line
})
