
require("bufferline").setup({
  options = {
    show_close_icon = false,
  },
  highlight = {guibg = "black"},
  offsets = {
    {
      filetype = "NvimTree",
      text = "File Explorer",
      highlight = "Directory",
      text_align = "right"
    },
  },
})
