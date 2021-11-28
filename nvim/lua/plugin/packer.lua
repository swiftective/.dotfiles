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
  "tar",
  "tarPlugin",
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
  use { "navarasu/onedark.nvim" }
  use {
    "Mofiqul/vscode.nvim",
    config = function()
      vim.g.vscode_style = "dark"
    end,
  }
  use "ThePrimeagen/git-worktree.nvim"
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
  use { "nvim-telescope/telescope-fzf-native.nvim", run = "make" }

  -- Pop up implementation still no baked
  use "nvim-lua/popup.nvim"

  -- motion plugin
  use {
    "ggandor/lightspeed.nvim",
    keys = { "s", "S", "F", "f", "t", "T" },
    config = function()
      -- Surround
      vim.api.nvim_set_keymap(
        "x",
        "S",
        "<Esc>gv<Cmd>lua require'surround'.surround_add()<CR>",
        { noremap = true, silent = true }
      )
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

  use {
    "blackCauldron7/surround.nvim",
    event = chold,
    config = function()
      require("surround").setup { mappings_style = "surround" }
    end,
  }
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
  use {
    "tzachar/cmp-tabnine",
    event = "InsertEnter",
    config = function()
      local tabnine = require "cmp_tabnine.config"
      tabnine:setup {
        max_lines = 1000,
        max_num_results = 20,
        sort = true,
        run_on_every_keystroke = true,
        snippet_placeholder = "..",
      }
    end,
    run = "./install.sh",
    requires = "hrsh7th/nvim-cmp",
  }
  use { "hrsh7th/cmp-nvim-lsp", event = "InsertEnter" }
  use { "hrsh7th/cmp-buffer", event = "insertenter" }
  use { "hrsh7th/cmp-cmdline", event = "InsertEnter" }
  use { "hrsh7th/cmp-path", event = "InsertEnter" }
  use { "hrsh7th/cmp-nvim-lua", event = "InsertEnter" }
  use { "petertriho/cmp-git", event = "InsertEnter" }
  use { "saadparwaiz1/cmp_luasnip", event = "insertenter" }

  use { "onsails/lspkind-nvim" }

  -- Snippets
  use "L3MON4D3/LuaSnip"
  use "rafamadriz/friendly-snippets"

  -- Debugging
  use {
    "mfussenegger/nvim-dap",
    config = function()
      require("dap.ext.vscode").load_launchjs()
      local dap = require "dap"
      dap.defaults.fallback.terminal_win_cmd = "50vsplit new"
    end,
  }
  use "Pocco81/DAPInstall.nvim"
  use {
    "rcarriga/nvim-dap-ui",
    requires = { "mfussenegger/nvim-dap" },
    config = function()
      require "plugin.dapui"
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
  use { "szw/vim-maximizer", event = chold }

  -- Running code snippet
  use {
    "michaelb/sniprun",
    run = "bash ./install.sh",
    -- event = chold,
    config = function()
      require("sniprun").setup {
        display = { "Classic", "NvimNotify" },
      }
    end,
  }

  -- Treesitter
  use {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
    config = function()
      require("nvim-treesitter.configs").setup {
        rainbow = {
          enable = true,
          disable = { "html" },
          extended_mode = true,
          max_file_lines = nil,
        },
        highlight = {
          enable = true,
          disable = { "html" },
          extended_mode = true,
          max_file_lines = nil,
        },
      }
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
    "folke/trouble.nvim",
    event = chold,
    requires = "kyazdani42/nvim-web-devicons",
  }
  use {
    "sbdchd/neoformat",
    event = chold,
    config = function()
      vim.g["neoformat_try_node_exe"] = 1
      vim.g["neoformat_basic_format_align"] = 1
      vim.g["neoformat_basic_format_retab"] = 1
      vim.g["neoformat_basic_format_trim"] = 1
      vim.g["neoformat_only_msg_on_error"] = 1
    end,
  } -- Formatting (Need to replace with null-ls)

  -- Terminal
  use {
    "akinsho/toggleterm.nvim",
    keys = "<A-t>",
    config = function()
      require("toggleterm").setup {
        size = 20,
        open_mapping = [[<A-t>]],
        insert_mappings = true,
        direction = "horizontal",
        close_on_exit = true,
      }
    end,
  }

  -- Notify
  use {
    "rcarriga/nvim-notify",
    event = chold,
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

  -- Session management
  use {
    "rmagatti/auto-session",
    config = function()
      require("auto-session").setup {
        log_level = "info",
        auto_session_suppress_dirs = { "~/", "~/workspace/Projects" },
      }
    end,
  }

  use {
    "rmagatti/session-lens",
    requires = { "rmagatti/auto-session", "nvim-telescope/telescope.nvim" },
    config = function()
      require("session-lens").setup {}
    end,
  }

  -- Lua
  use {
    "folke/which-key.nvim",
    config = function()
      require("which-key").setup()
    end,
  }

  if Packer_bootstrap then
    packer.sync()
  end
end)
