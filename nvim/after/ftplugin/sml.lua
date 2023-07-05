-- Standard ML
vim.keymap.set("n", "<leader>rc", "<cmd>!smlnj %<CR>", {
  noremap = true,
  silent = true,
  desc = "File Run for Standard ML",
  buffer = true,
})

vim.bo.commentstring = "(* %s *)"
