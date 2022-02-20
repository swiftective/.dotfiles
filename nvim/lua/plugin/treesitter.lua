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

parser_configs.norg = {
  install_info = {
    url = "https://github.com/nvim-neorg/tree-sitter-norg",
    files = { "src/parser.c", "src/scanner.cc" },
    branch = "main",
  },
}

parser_configs.norg_meta = {
  install_info = {
    url = "https://github.com/nvim-neorg/tree-sitter-norg-meta",
    files = { "src/parser.c" },
    branch = "main",
  },
}

parser_configs.norg_table = {
  install_info = {
    url = "https://github.com/nvim-neorg/tree-sitter-norg-table",
    files = { "src/parser.c" },
    branch = "main",
  },
}
