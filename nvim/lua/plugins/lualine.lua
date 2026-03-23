-- statusline
return {
  "nvim-lualine/lualine.nvim",
  event = "VeryLazy",
  config = function()
    require "config.lualine"
    require("lualine").hide()
  end,
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
}
