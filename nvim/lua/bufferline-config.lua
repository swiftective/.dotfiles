
require("bufferline").setup({
  options = {
    show_close_icon = false,
    diagnostics = "nvim_lsp",
    diagnostics_indicator = function(_, _, diagnostics_dict)
      local s = " "
      for e, n in pairs(diagnostics_dict) do
        local sym = e == "error" and "  " or (e == "warning" and "  " or " ")
        s = s .. sym .. n
      end
      return s
    end,
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
