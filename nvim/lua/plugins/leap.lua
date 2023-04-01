return {

  -- -- motion plugin
  {
    "ggandor/leap.nvim",
    event = "VeryLazy",
    config = function()
      local leap = require "leap"
      leap.add_default_mappings()
      leap.opts.safe_labels = { "s", "f", "n", "u", "t", "/", "F", "N", "L", "H", "M", "U", "G", "T", "?" }
      vim.keymap.set(
        { "n", "x", "o" },
        "gs",
        ":lua require('leap').leap { target_windows = require'leap.util'.get_enterable_windows() }<CR>",
        { noremap = true, silent = true, desc = "Leap from window" }
      )
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
