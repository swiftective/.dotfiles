return { -- Lua

  -- LSP
  {
    "j-hui/fidget.nvim",
    tag = "legacy",
    opts = { window = { blend = 0, relative = "editor" } },
    event = "VeryLazy",
  },

  {
    "folke/zen-mode.nvim",
    cmd = "ZenMode",
    opts = {
      window = {
        width = 0.55,
        options = {
          number = false,
          relativenumber = false,
        },
      },
      plugins = {
        tmux = { enabled = true },
      },
    },
  },

  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    config = true,
    opts = {
      notify = false,
    },
  },

  {
    "stevearc/dressing.nvim",
    event = "VeryLazy",
    config = function()
      require("dressing").setup {
        select = {
          enabled = true,
          telescope = require("telescope.themes").get_cursor(),
        },
      }
    end,
    dependencies = {
      "nvim-telescope/telescope.nvim",
    },
  },

  {
    "yamatsum/nvim-cursorline",
    pin = true,
    event = "VeryLazy",
    config = function()
      require("nvim-cursorline").setup {
        cursorline = {
          enable = true,
          timeout = 4000,
          number = false,
        },
        cursorword = {
          enable = false,
        },
      }
    end,
  },
}
