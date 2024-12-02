vim.o.tabstop = 2
vim.o.softtabstop = 2
vim.o.shiftwidth = 2

if vim.fn.expand("%:p:h"):match "projects" then
  vim.o.relativenumber = false
  vim.o.number = false

  vim.cmd [[
  hi MarkviewHeading1 guibg=none
  hi MarkviewHeading2 guibg=none
  hi MarkviewHeading3 guibg=none
  hi MarkviewHeading4 guibg=none
  hi MarkviewHeading5 guibg=none
  hi MarkviewHeading6 guibg=none
  ]]
end
