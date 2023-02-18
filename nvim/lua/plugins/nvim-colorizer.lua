return {
  {
    "Akianonymus/nvim-colorizer.lua",
    event = "VeryLazy",
    config = function()
      require("colorizer").setup {
        css = {
          RGB = true,
          RRGGBB = true,
          names = true,
          RRGGBBAA = true,
          rgb_fn = true,
          hsl_fn = true,
          css = true,
          css_fn = true,
          mode = "virtualtext",
        },
      }
    end,
  },

  {
    "ziontee113/color-picker.nvim",
    event = "VeryLazy",
    config = function()
      require "color-picker"
    end,
  },
}
