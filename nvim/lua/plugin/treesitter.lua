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

local parser_configs = require("nvim-treesitter.parsers").get_parser_configs()

parser_configs.org = {
  install_info = {
    url = "https://github.com/milisims/tree-sitter-org",
    revision = "f110024d539e676f25b72b7c80b0fd43c34264ef",
    files = { "src/parser.c", "src/scanner.cc" },
  },
  filetype = "org",
}
