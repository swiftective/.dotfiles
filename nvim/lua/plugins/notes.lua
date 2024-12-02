return {
  {
    "OXY2DEV/markview.nvim",
    -- lazy = false,
    -- ft = "markdown", -- If you decide to lazy-load anyway
    event = "VeryLazy",

    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-tree/nvim-web-devicons",
      "folke/tokyonight.nvim",
    },

    config = function()
      local presets_headings = require("markview.presets").headings
      local presets_checkboxes = require("markview.presets").checkboxes

      require("markview").setup {
        headings = presets_headings.arrowed,
        checkboxes = presets_checkboxes.nerd,
        highlight_groups = "dark",
        injections = {
          enable = false,
        },
      }
    end,
  },

  {
    "nvim-neorg/neorg",
    dependencies = { "nvim-lua/plenary.nvim" },
    version = "v7.0.0", -- This is the important part!
    event = "VeryLazy",
    config = function()
      require "config.norg"
    end,
  },
}
