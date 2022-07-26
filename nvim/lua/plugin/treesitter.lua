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
  },
  indent = {
    enable = true,
  },
}

-- local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
-- parser_config.dart.install_info.revision = "f95876f0ed3ef207bbd3c5c41987bc2e9cecfc97"
