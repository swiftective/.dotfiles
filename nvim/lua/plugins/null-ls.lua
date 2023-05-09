return {
  "jose-elias-alvarez/null-ls.nvim",
  event = "VeryLazy",
  config = function()
    local null_ls = require "null-ls"
    local formatting = null_ls.builtins.formatting
    -- local diagnostics = null_ls.builtins.diagnostics
    -- local completion = require("null-ls").builtins.completion

    require("null-ls").setup {
      sources = {
        -- diagnostics.eslint,
        formatting.stylua,
        formatting.prettier.with {
          filetypes = {
            "javascript",
            "javascriptreact",
            "typescript",
            "typescriptreact",
            "vue",
            "css",
            "scss",
            "less",
            "json",
            "yaml",
            "markdown",
            "graphql",
            "solidity",
            "html",
          },
          extra_args = { "--single-quote", "--jsx-single-quote" },
        },
        formatting.autopep8,
        -- completion.spell,
      },
    }

    vim.cmd [[command! LspFormat lua vim.lsp.buf.format { async = true }]]
  end,
}
