vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
  underline = {
    severity_limit = "Error",
  },
  signs = {
    severity_limit = "Error",
  },
  virtual_text = {
    severity_limit = "Error",
  },
})

vim.keymap.set("n", "<leader>j", function()
  vim.diagnostic.goto_next { severity = vim.diagnostic.severity.ERROR }
end, { noremap = true, silent = true })

vim.keymap.set("n", "<leader>k", function()
  vim.diagnostic.goto_prev { severity = vim.diagnostic.severity.ERROR }
end, { noremap = true, silent = true })
