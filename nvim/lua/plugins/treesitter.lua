return {

  -- Treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    event = "VeryLazy",
    build = ":TSUpdate",
  },

  {
    "HiPhish/rainbow-delimiters.nvim",
    event = "VeryLazy",
    dependencies = "nvim-treesitter/nvim-treesitter",
    config = function()
      require("rainbow-delimiters.setup").setup {
        blacklist = { "html", "tsx" },
      }
    end,
  },

  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    event = "VeryLazy",
    dependencies = "nvim-treesitter/nvim-treesitter",
    config = function()
      require "config.treesitter"
    end,
  },

  {
    "nvim-treesitter/nvim-treesitter-context",
    opts = { enable = false },
    event = "VeryLazy",
  },
}
