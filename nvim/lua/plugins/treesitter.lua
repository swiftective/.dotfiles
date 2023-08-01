return {

  -- Treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    event = "VeryLazy",
    build = ":TSUpdate",
  },

  {
    "nvim-treesitter/playground",
    event = "VeryLazy",
    cmd = "TSPlaygroundToggle",
    dependencies = "nvim-treesitter/nvim-treesitter",
  },

  { "p00f/nvim-ts-rainbow", event = "VeryLazy", dependencies = "nvim-treesitter/nvim-treesitter" },

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
