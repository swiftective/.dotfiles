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
snippet_collection.clear_snippets "racket"

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

  s(
    { trig = "fx(%d%d%d)", regTrig = true, snippetType = "autosnippet" },
    f(function(_, snip)
      return "This is the number: " .. snip.captures[1]
    end)
  ),

  s({ trig = "trig", snippetType = "autosnippet" }, t "This is autotrigger"),

  -- End Line
})

ls.add_snippets("racket", {
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
          fmt(";; took template from {}", { i(1, "Data definition") }),
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
    "dd",
    fmt(
      [[
          {}
          ;; {} is {}
          ;; Interp. {}
          ;; (define {})

          #;
          (define (fn-for-{} {})
            {}
          )

          ;; Template rules used
          ;; - {}
    ]],
      {
        c(1, {
          fmt("(define-struct {} ({}))", {
            i(1, "struct-name"),
            i(2, "fields"),
          }),
          t "",
        }),
        i(2, "Data definition"),
        i(3, "Type"),
        i(4, "Interpretation"),
        i(5, "Examples"),
        i(6, "type-name"),
        i(7, "parameter"),
        i(8, "Function Body"),
        i(0, "Rules"),
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

  s(
    { trig = "fc(%d)", regTrig = true },
    fmt(
      [[
      (define ({} {})
        (cond {}
        )
      )
    ]],
      {
        i(1, "func"),
        i(2, "args"),
        d(3, function(_, snip)
          local nodes = {}

          local count = tonumber(snip.captures[1])

          for j = 0, count - 1 do
            local cond = {
              t { "", "\t\t[" },
              i(1 + (j * 2), "Q"),
              t " ",
              i(2 + (j * 2), "A"),
              t "]",
            }

            for index, _ in ipairs(cond) do
              table.insert(nodes, cond[index])
            end
          end

          return sn(nil, nodes)
        end),
      }
    )
  ),

  s(
    "big-bang",
    fmt(
      [[

        ;; {} -> {}
        ;; start the world with ...
        ;;
        (define (main {})
          (big-bang {}                   ; {}
                    (on-tick   tock)     ; {} -> {}
                    (to-draw   render)   ; {} -> Image
                    (stop-when ...)      ; {} -> Boolean
                    (on-mouse  ...)      ; {} Integer Integer MouseEvent -> {}
                    (on-key    ...)))    ; {} KeyEvent -> {}
      ]],
      {
        i(1, "WS"),
        i(2, "WS"),
        i(3, "ws"),
        rep(3),
        rep(1),
        rep(1),
        rep(1),
        rep(1),
        rep(1),
        rep(1),
        rep(1),
        rep(1),
        rep(1),
      }
    )
  ),

  s(
    "wish-list",
    fmt(
      [[

    ;; {} -> {}
    ;; {}

    ;; TODO: {} func tests

    (define ({} {}) {}) ;stub

    ]],
      {
        i(1, "input type"),
        i(2, "return type"),
        i(3, "purpose"),
        rep(4),
        i(4, "func-name"),
        i(5, "args"),
        i(6, "return value"),
      }
    )
  ),

  -- Last Line
})
