return {

  -- -- motion plugin
  {
    "ggandor/leap.nvim",
    event = "VeryLazy",
    config = function()
      require "config.leap"
    end,
    dependencies = "tpope/vim-repeat",
  },

  {
    "ggandor/flit.nvim",
    event = "VeryLazy",
    dependencies = "ggandor/leap.nvim",
    opts = {
      keys = { f = "f", F = "F", t = "t", T = "T" },
      labeled_modes = "nvo",
      multiline = true,
      opts = {},
    },
  },

  { "ThePrimeagen/harpoon", event = "VeryLazy" },
}
