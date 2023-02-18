-- Color-scheme
return {
  "folke/tokyonight.nvim",
  config = function()
    require("tokyonight").setup {
      style = "night",
      transparent = true,
      terminal_colors = true,
      styles = {
        comments = { italic = true },
        keywords = { italic = true },
        functions = {},
        variables = {},
        sidebars = "transparent",
        floats = "transparent",
      },
      sidebars = {},
      day_brightness = 0.3,
      hide_inactive_statusline = false,
      dim_inactive = false,
      lualine_bold = false,
      on_highlights = function(hi)
        hi.Normal.bg = "none"
        hi.NormalFloat.bg = "none"
      end,
    }
  end,
}
