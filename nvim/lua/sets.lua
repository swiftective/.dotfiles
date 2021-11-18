vim.cmd [[
  let g:VM_mouse_mappings = 1
  let g:VM_custom_remaps = {'<c-c>': '<c-[>', '<C-f>': '<C-u>', '<C-j>': '<C-Down>', '<C-k>': '<C-Up>'}
]]
vim.g["undotree_SetFocusWhenToggle"] = 1
vim.g["undotree_WindowLayout"] = 3

vim.o.lazyredraw = true
vim.o.termguicolors = true
vim.o.timeoutlen = 800
vim.o.tabstop = 2
vim.o.softtabstop = 2
vim.o.shiftwidth = 2
vim.o.hidden = true
vim.o.expandtab = true
vim.o.smartindent = true
vim.o.exrc = true
vim.o.relativenumber = true
vim.o.nu = true
vim.cmd [[set undodir=~/.vim/undodir]]
vim.o.undofile = true
vim.o.showmode = false
vim.o.hlsearch = false
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.errorbells = false
vim.o.incsearch = true
vim.o.scrolloff = 15
vim.o.signcolumn = "yes"
vim.o.wrap = false
