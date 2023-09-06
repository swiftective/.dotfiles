local function lsp_format()
  vim.lsp.buf.format { async = true }
end

require("formatter").setup {
  logging = true,
  log_level = vim.log.levels.WARN,
  filetype = {
    lua = require("formatter.filetypes.lua").stylua,

    javascript = {
      require("formatter.filetypes.javascript").prettier,
    },

    typescript = {
      require("formatter.filetypes.typescript").prettier,
    },

    typescriptreact = {
      require("formatter.filetypes.typescriptreact").prettier,
    },

    ocaml = lsp_format,

    java = lsp_format,

    c = lsp_format,
  },
}
