vim.g["nvim_tree_quit_on_open"] = 1
vim.g["nvim_tree_indent_markers"] = 1
vim.g["nvim_tree_groutrue"] = 1
vim.g["nvim_tree_icon_padding"] = " "
vim.g["nvim_tree_refresh_wait"] = 20

require("nvim-tree").setup {
  disable_netrw = true,
  hijack_netrw = true,
  open_on_setup = false,
  ignore_ft_on_setup = {},
  auto_close = false,
  open_on_tab = false,
  hijack_cursor = false,
  diagnostics = {
    enable = true,
    icons = {
      hint = " ",
      info = " ",
      warning = " ",
      error = " ",
    },
  },
  update_cwd = false,
  update_focused_file = {
    enable = true,
    update_cwd = false,
    ignore_list = {},
  },
  system_open = {
    cmd = nil,
    args = {},
  },
  view = {
    width = 35,
    side = "left",
    auto_resize = true,
    mappings = {
      custom_only = false,
      list = {},
    },
  },
}
