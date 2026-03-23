return {

  -- -- motion plugin
  {
    "ggandor/leap.nvim",
    event = "VeryLazy",
    commit = "f19d43590c4b6d31188ee1ea2954d2b7558a9e11",
    config = function()
      require "config.leap"
    end,
    dependencies = "tpope/vim-repeat",
  },

  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope.nvim" },
    config = function()
      local harpoon = require "harpoon"
      local utils = require "swft.utils"

      harpoon:setup {
        settings = {
          save_on_toggle = true,
        },
      }

      harpoon:setup {}

      -- basic telescope configuration
      local conf = require("telescope.config").values
      local function toggle_telescope(harpoon_files)
        local file_paths = {}
        for _, item in ipairs(harpoon_files.items) do
          table.insert(file_paths, item.value)
        end

        require("telescope.pickers")
          .new({}, {
            prompt_title = "Harpoon",
            finder = require("telescope.finders").new_table {
              results = file_paths,
            },
            previewer = conf.file_previewer {},
            sorter = conf.generic_sorter {},
          })
          :find()
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
          "mo",
          function()
            harpoon.ui:toggle_quick_menu(harpoon:list())
          end,
          "Open Harpoon Menu",
        },
      }

      utils.custom_keymaps(keymaps)
    end,
    event = "VeryLazy",
  },
}
