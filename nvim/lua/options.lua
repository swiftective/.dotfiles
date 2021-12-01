vim.g.mapleader = " " -- Leader key
-- vim.o.lazyredraw = true
vim.o.sessionoptions = "buffers,curdir,folds,help,winsize,winpos,terminal"
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
vim.g.bufferline = {
  animation = true,
  auto_hide = true,
  tabpages = true,
  closable = true,
  clickable = true,
  icon_close_tab = "",
  exclude_name = { "package.json" },
  icons = true,
  icon_custom_colors = false,
  icon_separator_active = "▎",
  icon_separator_inactive = "▎",
  icon_close_tab_modified = "●",
  icon_pinned = "車",
  insert_at_start = true,
  maximum_padding = 1,
  maximum_length = 30,
  semantic_letters = true,
  letters = "asdfjkl;ghnmxcvbziowerutyqpASDFJKLGHNMXCVBZIOWERUTYQP",
  no_name_title = nil,
}
