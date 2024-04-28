return {
  -- Comment plugin
  { "numToStr/Comment.nvim", event = "VeryLazy", config = true },

  -- formatter
  {
    "mhartington/formatter.nvim",
    cmd = { "Format", "FormatWrite" },
    config = function()
      require "config.formatter"
    end,
  },

  { "eandrju/cellular-automaton.nvim", event = "VeryLazy" },
  {
    "kylechui/nvim-surround",
    event = "VeryLazy",
    config = function()
      vim.cmd [[
        nmap  gcc
        vmap  gc
        imap  <C-[>gcc
      ]]
      require("nvim-surround").setup {
        keymaps = {
          visual = "S",
        },
      }
    end,
  },

  -- Closing pairs
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = function()
      require("nvim-autopairs").setup()
      -- If you want insert `(` after select function or method item
      local cmp_autopairs = require "nvim-autopairs.completion.cmp"
      local cmp = require "cmp"
      cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
    end,
  },

  -- Autotags for html
  {
    "windwp/nvim-ts-autotag",
    event = "VeryLazy",
    config = true,
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

  -- install without yarn or npm
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown" },
    build = function()
      vim.fn["mkdp#util#install"]()
    end,
  },
}
