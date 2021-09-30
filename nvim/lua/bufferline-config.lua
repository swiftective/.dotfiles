
require("bufferline").setup({
  options = {
    show_close_icon = false,
    always_show_bufferline = false,
  },
  offsets = {
    {
      filetype = "NvimTree",
      text = "File Explorer",
      highlight = "Directory",
      text_align = "right"
    },
  },
})
