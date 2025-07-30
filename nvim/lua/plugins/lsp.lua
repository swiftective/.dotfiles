-- LSP
return {
  "neovim/nvim-lspconfig",
  -- event = "VeryLazy",
  dependencies = {
    { "williamboman/mason.nvim" },
    { "williamboman/mason-lspconfig.nvim" },
    -- { "mfussenegger/nvim-jdtls", ft = "java" },
    { "folke/lazydev.nvim", priority = 100, config = true, ft = "lua" },
  },
  config = function()
    require "config.lsp"
  end,
}
