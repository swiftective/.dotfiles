return {

  -- -- motion plugin
  {
    "ggandor/leap.nvim",
    event = "VeryLazy",
    config = function()
      require("leap").add_default_mappings()
    end,
  },

  {
    "ggandor/flit.nvim",
    event = "VeryLazy",
    dependencies = "ggandor/leap.nvim",
    config = function()
      require("flit").setup {
        keys = { f = "f", F = "F", t = "t", T = "T" },
        labeled_modes = "nvo",
        multiline = true,
        opts = {},
      }
    end,
  },

  { "ThePrimeagen/harpoon", event = "VeryLazy" },
}
