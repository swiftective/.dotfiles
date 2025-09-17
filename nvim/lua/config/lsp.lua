-- Automatically update diagnostics
vim.diagnostic.config {
  underline = true,
  update_in_insert = false,
  virtual_text = { spacing = 4, prefix = "●" },
  severity_sort = true,
}

vim.diagnostic.config {
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = " ",
      [vim.diagnostic.severity.WARN] = " ",
      [vim.diagnostic.severity.HINT] = " ",
      [vim.diagnostic.severity.INFO] = " ",
    },
  },
}

local border = {
  { "╭" },
  { "─" },
  { "╮" },
  { "│" },
  { "╯" },
  { "─" },
  { "╰" },
  { "│" },
}

local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
vim.lsp.util.open_floating_preview = function(contents, syntax, opts, ...)
  opts = opts or {}
  opts.border = opts.border or border
  return orig_util_open_floating_preview(contents, syntax, opts, ...)
end

require("lspconfig.ui.windows").default_options.border = "rounded"


-- lspconfig.racket_langserver.setup {}
-- lspconfig.millet.setup {}
-- lspconfig.ocamllsp.setup {}
-- lspconfig.gleam.setup {}
-- lspconfig.gdscript.setup {
--   flags = {
--     debounce_text_changes = 150,
--   },
-- }
--
-- lspconfig.elixirls.setup {
--   cmd = { "elixir-ls" },
-- }

-- vim.cmd "LspStart"
