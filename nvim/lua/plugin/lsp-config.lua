-- Automatically update diagnostics
vim.diagnostic.config {
  underline = true,
  update_in_insert = true,
  virtual_text = { spacing = 4, prefix = "●" },
  severity_sort = true,
}

local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }

for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

local border = {
  { "╭", "none" },
  { "─", "none" },
  { "╮", "none" },
  { "│", "none" },
  { "╯", "none" },
  { "─", "none" },
  { "╰", "none" },
  { "│", "none" },
}

local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
  opts = opts or {}
  opts.border = opts.border or border
  return orig_util_open_floating_preview(contents, syntax, opts, ...)
end
