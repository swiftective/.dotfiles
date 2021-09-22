

require('lualine').setup{
  options = {
    theme = 'auto',
    component_separators = {' ', ' '},
  },

  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch'},
    lualine_c = {
      {
        'filename',
        'g:coc_status',
        'diff',
        'diagnostics',
        -- table of diagnostic sources, available sources:
        -- nvim_lsp, coc, ale, vim_lsp
        sources = coc,
        -- displays diagnostics from defined severity
        sections = {'error', 'warn', 'info', 'hint'},
        -- all colors are in format #rrggbb
        color_error = red, -- changes diagnostic's error foreground color
        color_warn = yellow, -- changes diagnostic's warn foreground color
        color_info = yellow, -- Changes diagnostic's info foreground color
        color_hint = purple, -- Changes diagnostic's hint foreground color
        symbols = {error = 'E', warn = 'W', info = 'I', hint = 'H'}
      }
    },
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },

  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },

  tabline = {},

  extensions = {}
}

require("bufferline").setup{}



