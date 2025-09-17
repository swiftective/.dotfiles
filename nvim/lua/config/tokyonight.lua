---@diagnostic disable-next-line: missing-fields
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
    local swft_colors = require "swft.colors"

    for k, v in pairs(swft_colors) do
      if hi[k] and type(hi[k]) == "table" then
        for key, value in pairs(v) do
          hi[k][key] = value
        end
      else
        hi[k] = v
      end
    end
  end,
}

vim.cmd [[
  colorscheme tokyonight
]]
