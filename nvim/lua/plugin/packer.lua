vim.cmd [[packadd packer.nvim]]

local install_path = vim.fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
local fn = vim.fn
local packer = require "packer"
local use = packer.use
local chold = "CursorHold"

-- install packer if needed
if fn.empty(fn.glob(install_path)) > 0 then
  Packer_bootstrap = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
end

local disabled_built_ins = {
  "netrw",
  "netrwPlugin",
  "netrwSettings",
  "netrwFileHandlers",
  "gzip",
  "zip",
  "zipPlugin",
  "getscript",
  "getscriptPlugin",
  "vimball",
  "vimballPlugin",
  "2html_plugin",
  "logipat",
  "rrhelper",
  "spellfile_plugin",
  "matchit",
}

for _, plugin in pairs(disabled_built_ins) do
  vim.g["loaded_" .. plugin] = 1
end

packer.init {
  git = {
    clone_timeout = false,
  },
  display = {
    open_fn = require("packer.util").float, -- An optional function to open a window for packer's display
    prompt_border = "double", -- Border style of prompt popups.
  },
  profile = {
    enable = true,
    threshold = 1, -- integer in milliseconds, plugins which load faster than this won't be shown in profile output
  },
}

packer.reset()

return packer.startup(function()
  -- Packer
  use "wbthomason/packer.nvim"

  use {
    "lewis6991/impatient.nvim",
    config = function()
      require("impatient").enable_profile()
    end,
  }

  -- Color-scheme
  use "folke/tokyonight.nvim"

  use {
    "ThePrimeagen/git-worktree.nvim",
    config = function()
      require("telescope").load_extension "git_worktree"
    end,
    event = chold,
  }
  use {
    "norcalli/nvim-colorizer.lua",
    event = chold,
    config = function()
      require "plugin.colorizer"
    end,
  }
  use { "simrat39/symbols-outline.nvim", event = chold }

  -- statusline
  use {
    "nvim-lualine/lualine.nvim",
    requires = { "kyazdani42/nvim-web-devicons", opt = true },
  }

  -- Git
  use { "tpope/vim-fugitive", cmd = "Git" }
  use {
    "lewis6991/gitsigns.nvim",
    event = chold,
    config = function()
      require "plugin.git-signs"
    end,
    requires = {
      "nvim-lua/plenary.nvim",
    },
  }

  -- undotree
  use {
    "mbbill/undotree",
    event = chold,
    config = function()
      vim.g["undotree_SetFocusWhenToggle"] = 1
      vim.g["undotree_WindowLayout"] = 3
    end,
  }

  -- Fuzzy Finder
  use {
    "nvim-telescope/telescope.nvim",
    requires = { { "nvim-lua/plenary.nvim" } },
  }

  use {
    "nvim-telescope/telescope-fzf-native.nvim",
    run = "make",
    config = function()
      require("telescope").load_extension "fzf"
    end,
    event = chold,
  }

  -- motion plugin
  use {
    "ggandor/lightspeed.nvim",
    config = function()
      -- Surround
      require("lightspeed").setup {
        ignore_case = true,
      }
      -- vim.api.nvim_set_keymap("x", "E", "<Plug>VSurround", {})
    end,
  }

  -- Comment plugin
  use {
    "numToStr/Comment.nvim",
    event = chold,
    config = function()
      require("Comment").setup()
    end,
  }

  -- Indentline
  use {
    "lukas-reineke/indent-blankline.nvim",
    event = chold,
    config = function()
      require "plugin.indentline"
    end,
  }

  use { "tpope/vim-surround", event = chold }

  use {
    "windwp/nvim-autopairs",
    event = chold,
    config = function()
      require("nvim-autopairs").setup()
    end,
  }

  use {
    "windwp/nvim-ts-autotag",
    config = function()
      require("nvim-ts-autotag").setup()
    end,
    ft = { "html", "jsx", "tsx", "vue", "php", "svelte" },
    requires = "nvim-treesitter/nvim-treesitter",
  }

  -- Autocompletion
  use { "hrsh7th/nvim-cmp" }
  use { "hrsh7th/cmp-nvim-lsp", event = "InsertEnter" }
  use { "hrsh7th/cmp-buffer", event = "insertenter" }
  use { "hrsh7th/cmp-cmdline", event = "InsertEnter" }
  use { "hrsh7th/cmp-path", event = "InsertEnter" }
  use { "hrsh7th/cmp-nvim-lua", event = "InsertEnter" }
  use {
    "petertriho/cmp-git",
    event = "InsertEnter",
    config = function()
      require("cmp_git").setup()
    end,
  }
  use { "saadparwaiz1/cmp_luasnip", event = "insertenter" }

  -- Snippets
  use "L3MON4D3/LuaSnip"
  use "rafamadriz/friendly-snippets"
  use "Nash0x7E2/awesome-flutter-snippets"
  -- Debugging
  use {
    "mfussenegger/nvim-dap",
    config = function()
      require("dap.ext.vscode").load_launchjs()
      local dap = require "dap"
      dap.defaults.fallback.terminal_win_cmd = "50vsplit new"
    end,
  }
  use {
    "rcarriga/nvim-dap-ui",
    requires = { "mfussenegger/nvim-dap" },
    config = function()
      require "plugin.dapui"
    end,
  }
  use {
    "mfussenegger/nvim-dap-python",
    config = function()
      require("dap-python").setup()
    end,
  }
  use {
    "theHamsta/nvim-dap-virtual-text",
    config = function()
      require("nvim-dap-virtual-text").setup()
    end,
  }
  use {
    "nvim-telescope/telescope-dap.nvim",
    config = function()
      require("telescope").load_extension "dap"
    end,
  }
  use "David-Kunz/jester"

  -- Running code snippet
  use {
    "michaelb/sniprun",
    run = "bash ./install.sh",
    -- event = chold,
    config = function()
      require("sniprun").setup {
        display = { "Classic" },
      }
    end,
  }

  -- Treesitter
  use {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
    config = function()
      require "plugin.treesitter"
    end,
  }
  use { "nvim-treesitter/playground", cmd = "TSPlaygroundToggle" }
  use "p00f/nvim-ts-rainbow"

  -- LSP
  use "neovim/nvim-lspconfig"
  use "williamboman/nvim-lsp-installer"
  use {
    "antoinemadec/FixCursorHold.nvim",
    event = "VimEnter",
    config = function()
      -- 12587 issue neovim
      vim.g["cursorhold_updatetime"] = 100
    end,
  }

  use {
    "akinsho/flutter-tools.nvim",
    requires = "nvim-lua/plenary.nvim",
    ft = "dart",
    config = function()
      require("flutter-tools").setup {
        dev_log = {
          open_cmd = "edit",
        },
      } -- use defaults
      require("telescope").load_extension "flutter"
    end,
  }

  use {
    "folke/trouble.nvim",
    event = chold,
    requires = "kyazdani42/nvim-web-devicons",
  }

  -- Lua
  use {
    "folke/todo-comments.nvim",
    requires = "nvim-lua/plenary.nvim",
    config = function()
      require("todo-comments").setup()
    end,
  }

  use {
    "jose-elias-alvarez/null-ls.nvim",
    config = function()
      require "plugin.null-ls"
    end,
  }

  -- Notify
  use {
    "rcarriga/nvim-notify",
    -- event = chold,
    config = function()
      require("notify").setup {
        timeout = 800,
        background_colour = "#000000",
      }
      vim.notify = require "notify"
    end,
  }

  -- bufferline for asthetics
  use {
    "romgrk/barbar.nvim",
    event = chold,
  }

  use "ThePrimeagen/harpoon"

  -- file tree
  use "kyazdani42/nvim-tree.lua"

  use { "tpope/vim-repeat", event = chold } -- I'm very lazy

  -- vim multi cursors
  use {
    "mg979/vim-visual-multi",
    keys = "<C-n>",
    config = function()
      vim.cmd [[
       let g:VM_mouse_mappings = 1
       let g:VM_custom_remaps = {'<c-c>': '<c-[>', '<C-f>': '<C-u>', '<C-j>': '<C-Down>', '<C-k>': '<C-Up>'}
       ]]
    end,
  }

  use { "ThePrimeagen/vim-be-good", cmd = "VimBeGood" } -- A game for vimmers

  -- Lua
  use {
    "folke/which-key.nvim",
    config = function()
      require("which-key").setup()
    end,
  }

  use {
    "stevearc/dressing.nvim",
    config = function()
      require("dressing").setup {
        select = {
          enabled = true,
          telescope = require("telescope.themes").get_cursor(),
        },
      }
    end,
  }

  use {
    "declancm/maximize.nvim",
    config = function()
      require("maximize").setup {
        default_keymaps = false,
      }
    end,
  }

  if Packer_bootstrap then
    packer.sync()
  end
end)
