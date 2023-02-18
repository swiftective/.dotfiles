return {
  "jose-elias-alvarez/null-ls.nvim",
  event = "VeryLazy",
  config = function()
    local formatting = require("null-ls").builtins.formatting
    -- local completion = require("null-ls").builtins.completion
    -- local diagnostics = null_ls.builtins.diagnostics

    require("null-ls").setup {
      sources = {
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

    vim.cmd [[command! LspFormat lua vim.lsp.buf.formatting()]]
  end,
}
