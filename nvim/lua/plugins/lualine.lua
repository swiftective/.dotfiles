-- statusline
return {
  "nvim-lualine/lualine.nvim",
  event = "VeryLazy",
  config = function()
    require "config.lualine"
  end,
  dependencies = {
    "kyazdani42/nvim-web-devicons",
  },
}
