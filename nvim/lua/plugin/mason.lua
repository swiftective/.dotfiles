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
