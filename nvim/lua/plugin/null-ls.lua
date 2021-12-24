local formatting = require("null-ls").builtins.formatting
local completion = require("null-ls").builtins.completion
-- local diagnostics = null_ls.builtins.diagnostics

require("null-ls").setup {
  sources = {
    formatting.stylua,
    formatting.prettier.with {
      filetypes = {
        "vue",
        "css",
        "scss",
        "less",
        "html",
        "json",
        "yaml",
        "markdown",
        "graphql",
        "solidity",
      },
      extra_args = { "--no-semi", "--single-quote", "--jsx-single-quote" },
    },
    formatting.autopep8,
    completion.spell,
  },
}
