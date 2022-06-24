local opts = { noremap = true, silent = true }

vim.schedule(function()
  print "This is dart"
end)

vim.keymap.set("n", "<leader><leader>p", function()
  print "Hello dart"
end, opts)
