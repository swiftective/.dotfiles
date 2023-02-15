local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  }
end

vim.opt.rtp:prepend(lazypath)

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

    config = function()
      require("colorizer").setup {
        css = {
          RGB = true,
          RRGGBB = true,
          names = true,
          RRGGBBAA = true,
          rgb_fn = true,
          hsl_fn = true,
          css = true,
          css_fn = true,
          mode = "virtualtext",
        },
      }
    end,
  },

  {
    "ziontee113/color-picker.nvim",

    config = function()
      require "color-picker"
    end,
  },

  -- statusline
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "kyazdani42/nvim-web-devicons", event = "CursorHold" },
    config = function()
      pcall(require, "plugin.eviline")
      require("lualine").hide()
    end,
  },

  { "tpope/vim-fugitive",   cmd = "Git" },
  {
    "lewis6991/gitsigns.nvim",

    config = function()
      require "plugin.git-signs"
    end,
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
  },

  {
    "ThePrimeagen/git-worktree.nvim",
    config = function()
      require("telescope").load_extension "git_worktree"
    end,
  },

  -- undotree
  {
    "mbbill/undotree",

    config = function()
      vim.g["undotree_SetFocusWhenToggle"] = 1
      vim.g["undotree_WindowLayout"] = 3
    end,
  },

  -- Fuzzy Finder
  {
    "nvim-telescope/telescope.nvim",
    dependencies = { { "nvim-lua/plenary.nvim" } },
  },
  {
    "nvim-telescope/telescope-fzf-native.nvim",
    build = "make",
    config = function()
      require("telescope").load_extension "fzf"
    end,
  },

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
  {
    "numToStr/Comment.nvim",

    config = true,
  },

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
    config = function()
      require("nvim-surround").setup {
        keymaps = {
          visual = "E",
        },
      }
    end,
  },

  {
    "windwp/nvim-autopairs",

    config = true,
  },

  {
    "windwp/nvim-ts-autotag",
    config = true,
    ft = { "html", "jsx", "tsx", "vue", "php", "svelte" },
    dependencies = "nvim-treesitter/nvim-treesitter",
  },
  -- Autocompletion
  { "hrsh7th/nvim-cmp" },
  { "hrsh7th/cmp-nvim-lsp", event = "InsertEnter" },
  { "hrsh7th/cmp-buffer",   event = "insertenter" },
  { "hrsh7th/cmp-cmdline",  event = "InsertEnter" },
  { "hrsh7th/cmp-path",     event = "InsertEnter" },
  { "hrsh7th/cmp-nvim-lua", event = "InsertEnter" },
  {
    "petertriho/cmp-git",
    event = "InsertEnter",
    config = true,
  },
  { "saadparwaiz1/cmp_luasnip",   event = "insertenter" },

  -- Snippets
  "L3MON4D3/LuaSnip",
  "rafamadriz/friendly-snippets",
  "Nash0x7E2/awesome-flutter-snippets",

  -- Debugging
  {
    "mfussenegger/nvim-dap",

    config = function()
      require("dap.ext.vscode").load_launchjs()
      local dap = require "dap"
      dap.defaults.fallback.terminal_win_cmd = "50vsplit new"
      pcall(require, "plugin.dap")
    end,
  },

  {
    "rcarriga/nvim-dap-ui",
    dependencies = { "mfussenegger/nvim-dap" },

    config = function()
      require "plugin.dapui"
    end,
  },

  {
    "theHamsta/nvim-dap-virtual-text",
    after = "nvim-dap",
    config = true,
  },

  {
    "nvim-telescope/telescope-dap.nvim",
    after = "nvim-dap",
    config = function()
      require("telescope").load_extension "dap"
    end,
  },

  "David-Kunz/jester",

  -- Running code snippet
  {
    "michaelb/sniprun",
    build = "bash ./install.sh",

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
  { "p00f/nvim-ts-rainbow",       dependencies = "nvim-treesitter/nvim-treesitter" },

  -- LSP
  "neovim/nvim-lspconfig",
  "williamboman/mason.nvim",
  "williamboman/mason-lspconfig.nvim",

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
