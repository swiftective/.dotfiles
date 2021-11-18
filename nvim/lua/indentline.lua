-- Indentline
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
  },
  char_highlight_list = {
    "rainbowcol1",
    "rainbowcol2",
    "rainbowcol3",
    "rainbowcol4",
    "rainbowcol5",
    "rainbowcol6",
  },
  show_current_context = true,
  show_current_context_start = true,
}