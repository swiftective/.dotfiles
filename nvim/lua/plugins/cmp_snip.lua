return {

  -- Autocompletion
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    config = function()
      vim.o.completeopt = "menuone,noselect"

      local cmp = require "cmp" -- Completion

      local luasnip = require "luasnip" -- Snippets

      local types = require "luasnip.util.types"

      luasnip.config.set_config {
        -- This tells LuaSnip to remember to keep around the last snippet.
        -- You can jump back into it even if you move outside of the selection
        history = true,

        -- This one is cool cause if you have dynamic snippets, it updates as you type!
        updateevents = "TextChanged,TextChangedI",

        -- Autosnippets:
        enable_autosnippets = true,

        -- Crazy highlights!!
        -- #vid3
        -- ext_opts = nil,
        ext_opts = {
          [types.choiceNode] = {
            active = {
              -- virt_text = { { " <- Current Choice", "NonTest" } },
            },
          },
        },
      }

      local icons = {
        Text = "",
        Method = "",
        Function = "",
        Constructor = "",
        Field = "",
        Variable = "",
        Class = "",
        Interface = "",
        Module = "",
        Property = "",
        Unit = "",
        Value = "",
        Enum = "",
        Keyword = "",
        Snippet = "",
        Color = "",
        File = "",
        Reference = "",
        Folder = "",
        EnumMember = "",
        Constant = "",
        Struct = "",
        Event = "",
        Operator = "",
        TypeParameter = "",
      }

      local source_mapping = {
        luasnip = "[Snip]",
        nvim_lsp = "[LSP]",
        nvim_lua = "[Lua]",
        path = "[Path]",
        cmp_tabnine = "[TN]",
        git = "[GH]",
        buffer = "[Buffer]",
      }

      cmp.setup {
        snippet = {
          expand = function(args)
            require("luasnip").lsp_expand(args.body)
          end,
        },
        mapping = {
          ["<c-space>"] = cmp.mapping {
            i = function()
              if cmp.visible() then
                if not cmp.confirm { select = true } then
                  return
                end
              else
                cmp.complete()
              end
            end,
          },
          ["<C-d>"] = cmp.mapping.scroll_docs(4),
          ["<C-f>"] = cmp.mapping.scroll_docs(-4),
          ["<C-e>"] = cmp.mapping.close(),
          ["<Tab>"] = cmp.mapping(cmp.mapping.select_next_item(), { "i", "s" }),
          ["<S-Tab>"] = cmp.mapping(cmp.mapping.select_prev_item(), { "i", "s" }),
          ["<CR>"] = cmp.mapping.confirm { select = false },
          ["<C-j>"] = cmp.mapping(function(fallback)
            if luasnip.expand_or_jumpable() then
              luasnip.expand_or_jump()
            else
              fallback()
            end
          end, {
            "i",
            "s",
          }),
          ["<C-k>"] = cmp.mapping(function(fallback)
            if luasnip.jumpable(-1) then
              luasnip.jump(-1)
            else
              fallback()
            end
          end, {
            "i",
            "s",
          }),
        },
        experimental = {
          ghost_text = {
            hl_group = "NvimDapVirtualText",
          },
        },
        window = {
          documentation = {
            border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
          },
        },
        sources = {
          { name = "luasnip" },
          { name = "nvim_lsp" },
          { name = "nvim_lua" },
          { name = "git" },
          { name = "path" },
          { name = "cmdline" },
          {
            name = "buffer",
            option = {
              get_bufnrs = function()
                return vim.api.nvim_list_bufs()
              end,
            },
          },
        },
        formatting = {
          format = function(entry, vim_item)
            vim_item.kind = string.format("%s ", icons[vim_item.kind])
            local menu = source_mapping[entry.source.name]
            local empty_check = function()
              if entry.completion_item.data ~= nil and entry.completion_item.data.detail ~= nil then
                menu = entry.completion_item.data.detail .. "  " .. menu
              end
            end

            if entry.source.name == "cmp_tabnine" then
              empty_check()
              vim_item.kind = ""
            end
            if entry.source.name == "git" then
              empty_check()
              vim_item.kind = ""
            end
            if entry.source.name == "neorg" then
              empty_check()
              vim_item.kind = "🪄"
            end
            if entry.source.name == "orgmode" then
              empty_check()
              vim_item.kind = "🖋"
            end
            vim_item.menu = menu
            return vim_item
          end,
        },
      }

      vim.opt.runtimepath = vim.opt.runtimepath + "~/.config/nvim/snippets"
      require("luasnip/loaders/from_vscode").lazy_load()
    end,
    dependencies = {
      { "hrsh7th/cmp-nvim-lsp" },
      { "hrsh7th/cmp-buffer" },
      { "hrsh7th/cmp-cmdline" },
      { "hrsh7th/cmp-path" },
      { "hrsh7th/cmp-nvim-lua" },
      {
        "petertriho/cmp-git",
        config = true,
      },
      { "saadparwaiz1/cmp_luasnip" },
    },
  },

  -- Snippets
  {
    "L3MON4D3/LuaSnip",
    lazy = true,
    dependencies = {
      { "rafamadriz/friendly-snippets" },
      { "Nash0x7E2/awesome-flutter-snippets" },
    },
  },
}
