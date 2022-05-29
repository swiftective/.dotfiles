require("nvim-treesitter.configs").setup {
  rainbow = {
    enable = true,
    disable = { "html" },
    extended_mode = true,
    max_file_lines = nil,
  },
  highlight = {
    enable = true,
    disable = { "html" },
    extended_mode = true,
    max_file_lines = nil,
    additional_vim_regex_highlighting = { "org" }, -- Required since TS highlighter doesn't support all syntax features (conceal)
  },
  indent = {
    enable = true,
  },
}
