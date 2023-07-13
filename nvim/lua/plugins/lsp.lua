-- LSP
return {
  "neovim/nvim-lspconfig",
  event = "VeryLazy",
  dependencies = {
    { "williamboman/mason.nvim" },
    { "williamboman/mason-lspconfig.nvim" },
    { "folke/neodev.nvim", priority = 100, config = true },
  },
  config = function()
    require "config.lsp"
  end,
}
