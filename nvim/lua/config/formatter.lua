local util = require "formatter.util"

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

    css = {
      require("formatter.filetypes.css").prettier,
    },

    html = {
      require("formatter.filetypes.html").prettier,
    },

    svelte = require("formatter.filetypes.svelte").prettier,

    ocaml = lsp_format,

    java = lsp_format,

    c = lsp_format,

    cpp = lsp_format,

    elixir = lsp_format,

    python = { require("formatter.filetypes.python").autopep8 },

    markdown = { require("formatter.filetypes.markdown").prettier },

    go = lsp_format,

    sql = {
      {
        exe = "sqlfmt",
        args = {
          "-",
        },
      },
    },
  },
}
