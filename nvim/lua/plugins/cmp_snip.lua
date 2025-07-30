return {

  -- Autocompletion
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    config = function()
      require "config.cmp"
    end,
    dependencies = {
      { "hrsh7th/cmp-nvim-lsp" },
      { "hrsh7th/cmp-buffer" },
      { "hrsh7th/cmp-path" },
      { "hrsh7th/cmp-nvim-lsp-signature-help" },
      { "saadparwaiz1/cmp_luasnip" },
    },
  },

  -- Snippets
  {
    "L3MON4D3/LuaSnip",
    run = "make install_jsregexp",
    lazy = true,
    dependencies = {
      { "rafamadriz/friendly-snippets" },
    },
    config = function()
      for _, ft_path in ipairs(vim.api.nvim_get_runtime_file("lua/swft/snips/*.lua", true)) do
        loadfile(ft_path)()
      end

      require("luasnip.loaders.from_vscode").lazy_load()
    end,
  },
}
