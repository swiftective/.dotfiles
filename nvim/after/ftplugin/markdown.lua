vim.o.tabstop = 2
vim.o.softtabstop = 2
vim.o.shiftwidth = 2

if vim.fn.expand("%:p:h"):match "projects" then
  vim.o.relativenumber = false
  vim.o.number = false
end
