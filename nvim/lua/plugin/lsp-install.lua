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
          -- Setup your lua path
          path = vim.split(package.path, ";"),
        },
        diagnostics = {
          -- Get the language server to recognize the `vim` global
          globals = { "vim" },
        },
        -- workspace = {
        --   -- Make the server aware of Neovim runtime files
        --   library = {
        --     [vim.fn.expand "$VIMRUNTIME/lua"] = true,
        --     [vim.fn.expand "$VIMRUNTIME/lua/plugin"] = true,
        --     [vim.fn.expand "$VIMRUNTIME/lua/after"] = true,
        --   },
        -- },
      },
    },
  }
  server:setup(opts)
  vim.cmd [[ do User LspAttachBuffers ]]
end)
