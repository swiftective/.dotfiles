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

  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      local harpoon = require "harpoon"

      harpoon:setup {
        settings = {
          save_on_toggle = true,
        },
      }

      local function custom_keymaps(keymaps)
        for _, value in ipairs(keymaps) do
          local map = vim.keymap.set
          local opts = {}
          if value.opts then
            value.opts.desc = value[4]
            opts = value.opts
          else
            opts = { noremap = true, silent = true, desc = value[4] }
          end
          map(value[1], value[2], value[3], opts)
        end
      end

      local keymaps = {

        -- Navigation
        {
          "n",
          "mm",
          function()
            harpoon:list():add()
          end,
          "Harpoon Add File",
        },

        {
          "n",
          "<C-e>",
          function()
            harpoon:list():add()
            harpoon.ui:toggle_quick_menu(harpoon:list())
          end,
          "Add File and Open Harpoon Menu",
        },

        {
          "n",
          "mo",
          function()
            harpoon.ui:toggle_quick_menu(harpoon:list())
          end,
          "Open Harpoon Menu",
        },

        {
          "n",
          ",f",
          function()
            harpoon:list():select(1)
          end,
          "Harpoon Goto File 1",
        },

        {
          "n",
          ",d",
          function()
            harpoon:list():select(2)
          end,
          "Harpoon Goto File 2",
        },

        {
          "n",
          ",s",
          function()
            harpoon:list():select(3)
          end,
          "Harpoon Goto File 3",
        },

        {
          "n",
          ",a",
          function()
            harpoon:list():select(4)
          end,
          "Harpoon Goto File 4",
        },
      }

      custom_keymaps(keymaps)
    end,
    event = "VeryLazy",
  },
}
