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

vim.opt.shell = "/bin/dash"

local packer = require "packer"

vim.cmd [[packadd packer.nvim]]

packer.init {
  git = {
    clone_timeout = false,
  },
  display = {
    open_fn = require("packer.util").float, -- An optional function to open a window for packer's display
    working_sym = "⟳", -- The symbol for a plugin being installed/updated
    error_sym = "✗", -- The symbol for a plugin with an error in installation/updating
    done_sym = "✓", -- The symbol for a plugin which has completed installation/updating
    removed_sym = "-", -- The symbol for an unused plugin which was removed
    moved_sym = "→", -- The symbol for a plugin which was moved (e.g. from opt to start)
    header_sym = "━", -- The symbol for the header line in packer's display
    show_all_info = true, -- Should packer show all update details automatically?
    prompt_border = "double", -- Border style of prompt popups.
  },
}

local use = packer.use
packer.reset()

return packer.startup(function()
  -- Packer
  use "wbthomason/packer.nvim"

  -- Color-scheme
  use {
    "navarasu/onedark.nvim",
    config = function()
      vim.g.onedark_transparent_background = true
      vim.g.onedark_hide_ending_tildes = true
      vim.g.onedark_style = "deep"
    end,
  }
  -- use {
  --   "folke/tokyonight.nvim",
  --   config = function()
  --     vim.g.tokyonight_style = "night"
  --     vim.g.tokyonight_transparent = true
  --     vim.cmd [[colorscheme onedark]]
  --   end,
  -- }
  -- use {
  --   "Mofiqul/vscode.nvim",
  --   config = function()
  --     vim.g.vscode_style = "dark"
  --   end,
  -- }
  use "ThePrimeagen/git-worktree.nvim"
  use { "norcalli/nvim-colorizer.lua" }
  use "simrat39/symbols-outline.nvim"

  -- statusline
  use {
    "nvim-lualine/lualine.nvim",
    requires = { "kyazdani42/nvim-web-devicons", opt = true },
  }

  -- Git
  use "tpope/vim-fugitive"
  use "junegunn/gv.vim"
  use {
    "lewis6991/gitsigns.nvim",
    requires = {
      "nvim-lua/plenary.nvim",
    },
    config = function()
      require("gitsigns").setup {
        keymaps = {
          noremap = true,
          ["n ("] = { expr = true, "&diff ? ']c' : '<cmd>lua require\"gitsigns.actions\".next_hunk()<CR>'" },
          ["n )"] = { expr = true, "&diff ? '[c' : '<cmd>lua require\"gitsigns.actions\".prev_hunk()<CR>'" },
        },
      }
    end,
  }

  -- undotree
  use "mbbill/undotree"

  -- Fuzzy Finder
  use {
    "nvim-telescope/telescope.nvim",
    requires = { { "nvim-lua/plenary.nvim" } },
  }
  use { "nvim-telescope/telescope-fzf-native.nvim", run = "make" }

  -- Pop up implementation still no baked
  use "nvim-lua/popup.nvim"

  -- motion plugin
  use "ggandor/lightspeed.nvim"

  -- Comment plugin
  use {
    "numToStr/Comment.nvim",
    config = function()
      require("Comment").setup()
    end,
  }

  -- Indentline
  use "lukas-reineke/indent-blankline.nvim"

  use {
    "blackCauldron7/surround.nvim",
    config = function()
      require("surround").setup { mappings_style = "surround" }
    end,
  }
  use {
    "windwp/nvim-autopairs",
    config = function()
      require("nvim-autopairs").setup()
    end,
  }
  use {
    "windwp/nvim-ts-autotag",
    config = function()
      require("nvim-ts-autotag").setup()
    end,
  }

  -- Autocompletion
  use "hrsh7th/nvim-cmp"
  use { "tzachar/cmp-tabnine", run = "./install.sh", requires = "hrsh7th/nvim-cmp" }
  use "hrsh7th/cmp-nvim-lsp"
  use "hrsh7th/cmp-buffer"
  use "hrsh7th/cmp-cmdline"
  use "hrsh7th/cmp-path"
  use "hrsh7th/cmp-nvim-lua"
  use { "petertriho/cmp-git", requires = "nvim-lua/plenary.nvim" }
  use "onsails/lspkind-nvim"

  -- Debugging
  use "mfussenegger/nvim-dap"
  use "Pocco81/DAPInstall.nvim"
  use { "rcarriga/nvim-dap-ui", requires = { "mfussenegger/nvim-dap" } }
  use {
    "theHamsta/nvim-dap-virtual-text",
    config = function()
      require("nvim-dap-virtual-text").setup()
    end,
  }
  use "nvim-telescope/telescope-dap.nvim"
  use "David-Kunz/jester"
  use "szw/vim-maximizer"

  -- Treesitter
  use {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
  }
  use "nvim-treesitter/playground"
  use "p00f/nvim-ts-rainbow"

  -- LSP
  use "neovim/nvim-lspconfig"
  use "williamboman/nvim-lsp-installer"
  use "antoinemadec/FixCursorHold.nvim" -- Lsp performance issue to fix
  use "glepnir/lspsaga.nvim"
  use {
    "folke/trouble.nvim",
    requires = "kyazdani42/nvim-web-devicons",
  }
  use "sbdchd/neoformat" -- Formatting (Need to replace with null-ls)

  -- Snippets
  use "L3MON4D3/LuaSnip"
  use "saadparwaiz1/cmp_luasnip"
  use "rafamadriz/friendly-snippets"

  -- Terminal
  use "akinsho/toggleterm.nvim"

  -- Notify
  use "rcarriga/nvim-notify"

  -- bufferline for asthetics
  use { "romgrk/barbar.nvim", event = "CursorHold" }

  -- file tree
  use "kyazdani42/nvim-tree.lua"

  use "tpope/vim-repeat" -- I'm very lazy

  -- vim multi cursors
  use {
    "mg979/vim-visual-multi",
    event = "CursorHold",
  }

  use "ThePrimeagen/vim-be-good" -- A game for vimmers

  -- Session management
  use "tpope/vim-obsession"
end)
