-- LSP
return {
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "config.lsp"
    end,
  },

  {
    "mason-org/mason-lspconfig.nvim",
    dependencies = {
      {
        "mason-org/mason.nvim",
        opts = {
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
        },
      },

      "neovim/nvim-lspconfig",
    },
    opts = {
      ensure_installed = { "lua_ls" },
      automatic_enable = true,
    },
  },

  { "folke/lazydev.nvim", priority = 100, config = true, ft = "lua", dependencies = { "neovim/nvim-lspconfig" } },
}
