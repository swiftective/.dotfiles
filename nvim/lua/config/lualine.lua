local lualine = require "lualine"

local colors = {
  fg = "#565f89",
  bg = "#0000ffff",
  blue = "#51afef",
  green = "#98be65",
  cyan = "#008080",
  black = "#080808",
  red = "#ec5f67",
  violet = "#b2bff7",
  black2 = "#121212",
}

local bubbles_theme = {
  normal = {
    b = { fg = colors.fg, bg = colors.black2 },
    c = { fg = colors.black, bg = colors.bg },
  },
}

lualine.setup {
  options = {
    theme = bubbles_theme,
    component_separators = "|",
    section_separators = { left = "", right = "" },
  },
  sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {},
    lualine_x = {},
    lualine_y = {
      "branch",
      "filename",
      "diff",
      { "location", separator = { right = "" }, left_padding = 2 },
    },
    lualine_z = {},
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {},
    lualine_x = {},
    lualine_y = {},
    lualine_z = {},
  },
  tabline = {},
  extensions = {},
}
