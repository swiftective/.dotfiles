

require('lualine').setup {
  options = {
    theme = "ayu_mirage",
    section_separators = { "", "" },
    component_separators = { "", "" },
    -- section_separators = { "", "" },
    -- component_separators = { "", "" },
    icons_enabled = true,
  },
  sections = {
    lualine_a = { "mode" },
    lualine_b = { "branch" },
    lualine_c = { { "diagnostics", sources = { "coc" } }, "filename" },
    lualine_y = { "progress" },
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {},
    lualine_x = {},
    lualine_y = {},
    lualine_z = {},
  },
  extensions = { "nvim-tree" },
}

require("bufferline").setup{}



