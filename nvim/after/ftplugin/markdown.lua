vim.o.tabstop = 2
vim.o.softtabstop = 2
vim.o.shiftwidth = 2

if vim.fn.expand("%:p:h"):match "projects" then
  vim.opt_local.relativenumber = false
  vim.opt_local.number = false
end

vim.keymap.set("n", "<C-space>", function()
  require("swft.markdown").toggle_checkbox()
end, {
  buffer = true,
})

vim.keymap.set("n", "t", function()
  require("swft.markdown").toggle_checkbox_state()
end, {
  buffer = true,
})
