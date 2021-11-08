vim.o.completeopt = "menuone,noselect"

local cmp = require "cmp"

local luasnip = require("luasnip")

cmp.setup(
    {
        snippet = {
            expand = function(args)
                require("luasnip").lsp_expand(args.body)
            end
        },
        mapping = {
            ["<c-space>"] = cmp.mapping {
                i = cmp.mapping.complete(),
                c = function(_ --[[fallback]])
                    if cmp.visible() then
                        if not cmp.confirm {select = true} then
                            return
                        end
                    else
                        cmp.complete()
                    end
                end
            },
            ["<C-d>"] = cmp.mapping.scroll_docs(4),
            ["<C-f>"] = cmp.mapping.scroll_docs(-4),
            ["<C-e>"] = cmp.mapping.close(),
            ["<Tab>"] = cmp.mapping(cmp.mapping.select_next_item(), {"i", "s"}),
            ["<S-Tab>"] = cmp.mapping(cmp.mapping.select_prev_item(), {"i", "s"}),
            ["<CR>"] = cmp.mapping.confirm({select = false}),
            ["<C-j>"] = cmp.mapping(
                function(fallback)
                    if luasnip.expand_or_jumpable() then
                        luasnip.expand_or_jump()
                    elseif cmp.visible then
                        cmp.confirm({select = true})
                    else
                        fallback()
                    end
                end,
                {"i", "s"}
            ),
            ["<c-q>"] = cmp.mapping.confirm {
                behavior = cmp.ConfirmBehavior.Replace,
                select = true
            },
            ["<C-k>"] = cmp.mapping(
                function(fallback)
                    if luasnip.jumpable(-1) then
                        luasnip.jump(-1)
                    else
                        fallback()
                    end
                end,
                {"i", "s"}
            )
        },
        sources = {
            {name = "luasnip"},
            {name = "nvim_lsp"},
            {name = "nvim_lua"},
            {name = "path"},
            {name = "cmdline"},
            {name = "buffer"}
        },
        formatting = {
            format = function(entry, vim_item)
                vim_item.kind = require("lspkind").presets.codicons[vim_item.kind] .. "  " .. vim_item.kind
                return vim_item
            end
        }
    }
)

vim.opt.runtimepath = vim.opt.runtimepath + "~/.config/nvim/snippets"
require("luasnip/loaders/from_vscode").lazy_load()
