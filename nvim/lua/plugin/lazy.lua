local opts = {
  ui = {
    border = "rounded",
  },
}

local plugins = {

  -- Color-scheme
  "folke/tokyonight.nvim",

  {
    "Akianonymus/nvim-colorizer.lua",
    lazy = true,
    config = function()
      pcall(require, "plugin.colorizer")
    end,
  },

  {
    "ziontee113/color-picker.nvim",
    lazy = true,
    config = function()
      pcall(require, "plugin.color-picker")
    end,
  },

  -- statusline
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "kyazdani42/nvim-web-devicons", event = "CursorHold" },
  },

  { "tpope/vim-fugitive", cmd = "Git" },

  {
    "lewis6991/gitsigns.nvim",
    config = function()
      pcall(require, "plugin.gitsigns")
    end,
    lazy = true,
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
  },

  { "ThePrimeagen/git-worktree.nvim" },

  -- undotree
  { "mbbill/undotree" },

  -- Fuzzy Finder
  {
    "nvim-telescope/telescope.nvim",
    dependencies = { { "nvim-lua/plenary.nvim" } },
  },

  { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },

  -- motion plugin
  {
    "ggandor/lightspeed.nvim",
    config = function()
      -- Surround
      require("lightspeed").setup {
        ignore_case = true,
      }
    end,
  },

  -- Comment plugin
  { "numToStr/Comment.nvim", config = true },

  -- Indentline
  {
    "lukas-reineke/indent-blankline.nvim",
    cmd = { "IndentBlanklineEnable", "IndentBlanklineToggle" },
    config = function()
      require "plugin.indentline"
    end,
  },

  {
    "kylechui/nvim-surround",
    event = "CursorHold",
    config = function()
      require "plugin.surround"
    end,
  },

  { "windwp/nvim-autopairs", event = "CursorHold", config = true },

  {
    "windwp/nvim-ts-autotag",
    event = "CursorHold",
    config = true,
    ft = { "html", "jsx", "tsx", "vue", "php", "svelte" },
    dependencies = "nvim-treesitter/nvim-treesitter",
  },

  -- LSP
  { "neovim/nvim-lspconfig", lazy = true },
  { "williamboman/mason.nvim", lazy = true },
  { "williamboman/mason-lspconfig.nvim", lazy = true },

  -- Autocompletion
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    config = function()
      pcall(require, "plugin.cmp")
      pcall(require, "plugin.mason")
    end,
  },
  { "hrsh7th/cmp-nvim-lsp", event = "InsertEnter" },
  { "hrsh7th/cmp-buffer", event = "insertenter" },
  { "hrsh7th/cmp-cmdline", event = "InsertEnter" },
  { "hrsh7th/cmp-path", event = "InsertEnter" },
  { "hrsh7th/cmp-nvim-lua", event = "InsertEnter" },
  {
    "petertriho/cmp-git",
    event = "InsertEnter",
    config = true,
  },
  { "saadparwaiz1/cmp_luasnip", event = "insertenter" },

  -- Snippets
  { "L3MON4D3/LuaSnip", lazy = true },
  { "rafamadriz/friendly-snippets", lazy = true },
  { "Nash0x7E2/awesome-flutter-snippets", ft = { "dart" } },

  -- Debugging
  {
    "mfussenegger/nvim-dap",
    lazy = true,
    config = function()
      require("dap.ext.vscode").load_launchjs()
      local dap = require "dap"
      dap.defaults.fallback.terminal_win_cmd = "50vsplit new"
      pcall(require, "plugin.dap")
    end,
  },

  {
    "rcarriga/nvim-dap-ui",
    lazy = true,
    dependencies = { "mfussenegger/nvim-dap" },
    config = function()
      require "plugin.dapui"
    end,
  },

  {
    "theHamsta/nvim-dap-virtual-text",
    lazy = true,
    after = "nvim-dap",
    config = true,
  },

  {
    "nvim-telescope/telescope-dap.nvim",
    lazy = true,
    after = "nvim-dap",
    config = function()
      require("telescope").load_extension "dap"
    end,
  },

  {
    "David-Kunz/jester",
    after = "nvim-dap",
  },

  -- Running code snippet
  {
    "michaelb/sniprun",
    build = "bash ./install.sh",
    event = "CursorHold",
    config = function()
      require("sniprun").setup {
        display = { "Classic" },
      }
    end,
  },
  -- Treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      require "plugin.treesitter"
    end,
  },
  { "nvim-treesitter/playground", cmd = "TSPlaygroundToggle" },
  { "p00f/nvim-ts-rainbow", dependencies = "nvim-treesitter/nvim-treesitter" },

  {
    "akinsho/flutter-tools.nvim",
    dependencies = "nvim-lua/plenary.nvim",
    ft = "dart",
    config = function()
      require("flutter-tools").setup {
        dev_log = {
          open_cmd = "edit",
        },
      } -- use defaults
      require("telescope").load_extension "flutter"
    end,
  },

  {
    "folke/trouble.nvim",

    dependencies = "kyazdani42/nvim-web-devicons",
  },

  -- Lua
  {
    "folke/todo-comments.nvim",

    dependencies = "nvim-lua/plenary.nvim",
    config = true,
  },

  {
    "jose-elias-alvarez/null-ls.nvim",
    config = function()
      require "plugin.null-ls"
    end,
  },

  "ThePrimeagen/harpoon",

  -- file tree
  "kyazdani42/nvim-tree.lua",

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

  -- Lua
  {
    "folke/which-key.nvim",
    config = true,
  },

  {
    "stevearc/dressing.nvim",
    config = function()
      require("dressing").setup {
        select = {
          enabled = true,
          telescope = require("telescope.themes").get_cursor(),
        },
      }
    end,
  },

  {
    "yamatsum/nvim-cursorline",

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

require("lazy").setup(plugins, opts)
