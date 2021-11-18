-- Leader key
vim.g.mapleader = " "

-- 12587 issue neovim
vim.g["cursorhold_updatetime"] = 100

require "plugins"
require "telescope-config"
require "remaps"
require "git-config"
require "lsp-config"
require "functions"
require "color-config"
require "sets"
require "nvimtree-config"
require "notify-config"
require "pairs"
require "indentline"
require "debug-config"
require "evil_lualine"
require "barbar-config"
require "colorizer-config"
require "term-config"
require "treesitter-config"