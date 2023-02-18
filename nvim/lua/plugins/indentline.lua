-- Indentline
return {
  "lukas-reineke/indent-blankline.nvim",
  cmd = { "IndentBlanklineEnable", "IndentBlanklineToggle" },
  config = function()
    require("indent_blankline").setup {
      char = "▏",
      buftype_exclude = { "help", "terminal", "nofile", "nowrite" },
      filetype_exclude = {
        "vimwiki",
        "coc-explorer",
        "help",
        "undotree",
        "diff",
        "dapui_stacks",
        "dapui_scopes",
        "dapui_watches",
        "dapui_breakpoints",
        "dap-repl",
        "org",
        "norg",
        "lisp",
      },
      show_current_context = true,
      show_current_context_start = true,
    }
  end,
}
