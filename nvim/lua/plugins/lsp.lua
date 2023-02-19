-- LSP
return {
  "neovim/nvim-lspconfig",
  dependencies = {
    { "williamboman/mason.nvim" },
    { "williamboman/mason-lspconfig.nvim" },
  },
  config = function()
    -- Automatically update diagnostics
    vim.diagnostic.config {
      underline = true,
      update_in_insert = false,
      virtual_text = { spacing = 4, prefix = "●" },
      severity_sort = true,
    }

    local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }

    for type, icon in pairs(signs) do
      local hl = "DiagnosticSign" .. type
      vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
    end

    local border = {
      { "╭" },
      { "─" },
      { "╮" },
      { "│" },
      { "╯" },
      { "─" },
      { "╰" },
      { "│" },
    }

    local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
    function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
      opts = opts or {}
      opts.border = opts.border or border
      return orig_util_open_floating_preview(contents, syntax, opts, ...)
    end

    require("lspconfig.ui.windows").default_options.border = "rounded"

    local mason = require "mason"
    local mason_lsp = require "mason-lspconfig"
    local lspconfig = require "lspconfig"

    mason.setup {
      ui = {
        border = "rounded",
        icons = {
          package_installed = "",
          package_pending = "",
          package_uninstalled = "",
        },
        keymaps = {
          apply_language_filter = "f",
        },
      },
    }

    mason_lsp.setup_handlers {
      function(server_name) -- default handler (optional)
        lspconfig[server_name].setup {}
      end,
      -- Next, you can provide targeted overrides for specific servers.
      ["lua_ls"] = function()
        lspconfig.lua_ls.setup {
          settings = {
            Lua = {
              runtime = {
                version = "LuaJIT",
              },
              diagnostics = {
                globals = { "vim", "Luasnip_ns_id" },
              },
              telemetry = {
                enable = false,
              },
            },
          },
        }
      end,
    }
  end,
}
