return { -- Lua

  -- LSP
  {
    "j-hui/fidget.nvim",
    opts = {
      notification = {
        configs = {
          default = {
            format_annote = function()
              return ""
            end,
          },
        },
        window = {
          winblend = 0, -- Background transparency (0 = solid)
        },
      },
    },
    event = "VeryLazy",
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

  -- {
  --   "yamatsum/nvim-cursorline",
  --   pin = true,
  --   event = "VeryLazy",
  --   config = function()
  --     require("nvim-cursorline").setup {
  --       cursorline = {
  --         enable = false,
  --         timeout = 4000,
  --         number = false,
  --       },
  --       cursorword = {
  --         enable = false,
  --       },
  --     }
  --   end,
  -- },
}
