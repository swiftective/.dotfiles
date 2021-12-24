local lsp_installer = require "nvim-lsp-installer"

-- Provide settings first!
lsp_installer.settings {
  ui = {
    icons = {
      server_installed = "✓",
      server_pending = "➜",
      server_uninstalled = "✗",
    },
  },
}

lsp_installer.on_server_ready(function(server)
  local opts = {
    settings = {
      Lua = {
        runtime = {
          version = "LuaJIT",
        },
        diagnostics = {
          globals = { "vim", "Luasnip_ns_id" },
        },
      },
    },
  }
  server:setup(opts)
  vim.cmd [[ do User LspAttachBuffers ]]
end)
