return {
  -- Comment plugin
  { "numToStr/Comment.nvim", event = "VeryLazy", config = true },
  {
    "kylechui/nvim-surround",
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup {
        keymaps = {
          visual = "E",
        },
      }
    end,
  },

  -- Closing pairs
  { "windwp/nvim-autopairs", event = "VeryLazy", config = true },

  -- Autotags for html
  {
    "windwp/nvim-ts-autotag",
    event = "VeryLazy",
    config = true,
    ft = { "html", "jsx", "tsx", "vue", "php", "svelte" },
    dependencies = "nvim-treesitter/nvim-treesitter",
  },

  -- Running code snippet
  {
    "michaelb/sniprun",
    build = "bash ./install.sh",
    event = "VeryLazy",
    config = function()
      require("sniprun").setup {
        display = { "Classic" },
      }
    end,
  },

  {
    "folke/trouble.nvim",
    event = "VeryLazy",
    dependencies = "kyazdani42/nvim-web-devicons",
  },

  -- Lua
  {
    "folke/todo-comments.nvim",
    event = "VeryLazy",
    dependencies = "nvim-lua/plenary.nvim",
    config = true,
  },

  -- vim multi cursors
  {
    "mg979/vim-visual-multi",
    keys = { "<C-n>", desc = "Multi cursors" },
    config = function()
      vim.cmd [[
       let g:VM_mouse_mappings = 1
       let g:VM_custom_remaps = {'<c-c>': '<c-[>', '<C-f>': '<C-u>', '<C-j>': '<C-Down>', '<C-k>': '<C-Up>'}
       ]]
    end,
  },

  { "ThePrimeagen/vim-be-good", cmd = "VimBeGood" }, -- A game for vimmers
}
