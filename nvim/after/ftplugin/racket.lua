-- Racket
vim.keymap.set("n", "<leader>rc", "<cmd>!racket %<CR>", {
  noremap = true,
  silent = true,
  desc = "File Run for Racket",
  buffer = true,
})

vim.bo.commentstring = "; %s"

vim.cmd "ab lambda λ"
