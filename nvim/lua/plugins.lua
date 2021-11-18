vim.cmd [[packadd packer.nvim]]

local install_path = vim.fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
local fn = vim.fn
local packer = require "packer"
local use = packer.use

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
    event = "CursorHold",
    config = function()
      require("colorizer").setup({ "*" }, {
        RGB = true, -- #RGB hex codes
        RRGGBB = true, -- #RRGGBB hex codes
        names = true, -- "Name" codes like Blue
        RRGGBBAA = true, -- #RRGGBBAA hex codes
        rgb_fn = true, -- CSS rgb() and rgba() functions
        hsl_fn = true, -- CSS hsl() and hsla() functions
        css = true, -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
        css_fn = true, -- Enable all CSS *functions*: rgb_fn, hsl_fn
      })
    end,
  }
  use "simrat39/symbols-outline.nvim"

  -- statusline
  use {
    "nvim-lualine/lualine.nvim",
    requires = { "kyazdani42/nvim-web-devicons", opt = true },
  }

  -- Git
  use { "tpope/vim-fugitive", cmd = "Git" }
  use {
    "lewis6991/gitsigns.nvim",
    event = "BufEnter",
    config = function()
      require "git-signs"
    end,
    requires = {
      "nvim-lua/plenary.nvim",
    },
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
    event = "VimEnter",
    config = function()
      require("Comment").setup()
    end,
  }

  -- Indentline
  use {
    "lukas-reineke/indent-blankline.nvim",
    config = function()
      require("indent_blankline").setup {
        char = "▏",
        buftype_exclude = { "help", "terminal", "nofile", "nowrite" },
        filetype_exclude = {
          "vimwiki",
          "coc-explorer",
          "help",
          "undotree",
          "diff",
          "dapui_stacks",
          "dapui_scopes",
          "dapui_watches",
          "dapui_breakpoints",
          "dap-repl",
        },
        char_highlight_list = {
          "rainbowcol1",
          "rainbowcol2",
          "rainbowcol3",
          "rainbowcol4",
          "rainbowcol5",
          "rainbowcol6",
        },
        show_current_context = true,
        show_current_context_start = true,
      }
    end,
  }

  use {
    "blackCauldron7/surround.nvim",
    event = "VimEnter",
    config = function()
      require("surround").setup { mappings_style = "surround" }
    end,
  }
  use {
    "windwp/nvim-autopairs",
    event = "VimEnter",
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
  use "hrsh7th/cmp-nvim-lsp"
  use "hrsh7th/cmp-buffer"
  use "hrsh7th/cmp-cmdline"
  use "hrsh7th/cmp-path"
  use "hrsh7th/cmp-nvim-lua"
  use { "petertriho/cmp-git", requires = "nvim-lua/plenary.nvim" }
  use "onsails/lspkind-nvim"

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
      require("dapui").setup {
        sidebar = {
          elements = {
            {
              id = "scopes",
              size = 0.20, -- Can be float or integer > 1
            },
            { id = "breakpoints", size = 0.20 },
            { id = "stacks", size = 0.30 },
            { id = "watches", size = 0.20 },
          },
          size = 15,
          position = "bottom", -- Can be "left", "right", "top", "bottom"
        },
        tray = {
          elements = { "repl" },
          size = 50,
          position = "right", -- Can be "left", "right", "top", "bottom"
        },
        floating = {
          max_height = 0.3, -- These can be integers or a float between 0 and 1.
          max_width = 0.3, -- Floats will be treated as percentage of your screen.
          border = "rounded", -- Border style. Can be "single", "double" or "rounded"
        },
        windows = { indent = 0 },
      }
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
  use "szw/vim-maximizer"

  -- Running code snippet
  use { "michaelb/sniprun", run = "bash ./install.sh", cmd = "SnipRun" }

  -- Treesitter
  use {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
    config = function()
      require("nvim-treesitter.configs").setup {
        rainbow = {
          enable = true,
          extended_mode = true,
          max_file_lines = nil,
        },
        highlight = {
          enable = true,
          extended_mode = true,
          max_file_lines = nil,
        },
      }
    end,
  }
  use "nvim-treesitter/playground"
  use "p00f/nvim-ts-rainbow"

  -- LSP
  use "neovim/nvim-lspconfig"
  use "williamboman/nvim-lsp-installer"
  use "antoinemadec/FixCursorHold.nvim" -- Lsp performance issue to fix
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
  use {
    "akinsho/toggleterm.nvim",
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
    event = "CursorHold",
    config = function()
      require("notify").setup {
        timeout = 800,
        background_colour = "#000000",
      }
      vim.notify = require "notify"
    end,
  }

  -- bufferline for asthetics
  use { "romgrk/barbar.nvim", event = "CursorHold" }

  -- file tree
  use "kyazdani42/nvim-tree.lua"

  use { "tpope/vim-repeat", event = "CursorHold" } -- I'm very lazy

  -- vim multi cursors
  use {
    "mg979/vim-visual-multi",
    keys = "<C-n>",
  }

  use { "ThePrimeagen/vim-be-good", cmd = "VimBeGood" } -- A game for vimmers

  -- Session management
  use { "tpope/vim-obsession", cmd = "Obsession" }

  if Packer_bootstrap then
    packer.sync()
  end
end)
