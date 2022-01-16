vim.o.completeopt = "menuone,noselect"

local cmp = require "cmp" -- Completion

local luasnip = require "luasnip" -- Snippets

local lspkind = require "lspkind" -- Add icons

local source_mapping = {
  buffer = "[Buffer]",
  nvim_lsp = "[LSP]",
  nvim_lua = "[Lua]",
  path = "[Path]",
  luasnip = "[Snip]",
  cmp_git = "[GH]",
  orgmode = "[ORG]",
  neorg = "[NORG]",
  cmp_tabnine = "[TN]",
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
  documentation = {
    border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
  },
  sources = {
    { name = "luasnip" },
    { name = "nvim_lsp" },
    { name = "nvim_lua" },
    { name = "buffer" },
    { name = "neorg" },
    { name = "orgmode" },
    { name = "path" },
    { name = "cmdline" },
    { name = "cmp_git" },
    { name = "neorg" },
    { name = "cmp_tabnine" },
  },
  formatting = {
    format = function(entry, vim_item)
      vim_item.kind = lspkind.presets.codicons[vim_item.kind] .. " "
      local menu = source_mapping[entry.source.name]
      if entry.source.name == "cmp_tabnine" then
        if entry.completion_item.data ~= nil and entry.completion_item.data.detail ~= nil then
          menu = entry.completion_item.data.detail .. "  " .. menu
        end
        vim_item.kind = ""
      end
      if entry.source.name == "cmp_git" then
        if entry.completion_item.data ~= nil and entry.completion_item.data.detail ~= nil then
          menu = entry.completion_item.data.detail .. "  " .. menu
        end
        vim_item.kind = ""
      end
      if entry.source.name == "neorg" then
        if entry.completion_item.data ~= nil and entry.completion_item.data.detail ~= nil then
          menu = entry.completion_item.data.detail .. "  " .. menu
        end
        vim_item.kind = "🪄"
      end
      if entry.source.name == "orgmode" then
        if entry.completion_item.data ~= nil and entry.completion_item.data.detail ~= nil then
          menu = entry.completion_item.data.detail .. "  " .. menu
        end
        vim_item.kind = "🖋"
      end
      vim_item.menu = menu
      return vim_item
    end,
  },
}

vim.opt.runtimepath = vim.opt.runtimepath + "~/.config/nvim/snippets"
require("luasnip/loaders/from_vscode").lazy_load()
