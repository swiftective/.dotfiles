vim.g.mapleader = " " -- Leader key
vim.o.cursorline = true
vim.o.sessionoptions = "buffers,curdir,folds,help,winsize,winpos,terminal"
vim.o.updatetime = 100
vim.o.termguicolors = true
vim.o.timeoutlen = 500
vim.o.foldenable = false
vim.o.foldmethod = "expr"
vim.o.foldexpr = "nvim_treesitter#foldexpr()"
vim.o.tabstop = 2
vim.o.softtabstop = 2
vim.o.shiftwidth = 2
vim.o.hidden = true
vim.o.expandtab = true
vim.o.smartindent = true
vim.o.exrc = true
vim.o.relativenumber = true
vim.o.nu = true
vim.cmd [[set undodir=~/.local/share/nvim/undodir]]
vim.o.undofile = true
vim.o.showmode = false
vim.o.hlsearch = false
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.errorbells = false
vim.o.incsearch = true
vim.o.signcolumn = "yes"
vim.o.wrap = false

vim.opt.guifont = { "JetBrainsMono Nerd Font", ":h8" }

vim.g["undotree_SetFocusWhenToggle"] = 1
vim.g["undotree_WindowLayout"] = 3

vim.o.laststatus = 3
vim.o.statusline = " "
