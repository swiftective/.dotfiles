return { -- Lua
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    config = true,
  },

  {
    "stevearc/dressing.nvim",
    event = "VeryLazy",
    config = function()
      require("dressing").setup {
        select = {
          enabled = true,
          telescope = require("telescope.themes").get_cursor(),
        },
      }
      vim.cmd [[

      " colorscheme mess
      function! Colord()
        :syntax on
        :hi NvimDapVirtualText guifg=#455574 guibg=none gui=bold
        :hi Folded guifg=#5c719c guibg=#121212
        :hi CursorLine guibg=#151c30
        :hi IndentBlanklineContextChar guifg=cyan
        :hi TSVariable ctermfg=204 guifg=#aed8f2
        :hi IncSearch guibg=Cyan guifg=Black
        :hi LineNr guibg=NONE ctermbg=NONE
        :hi SignColumn guibg=NONE ctermbg=NONE
        :hi EndOfBuffer guibg=NONE ctermbg=NONE guifg=Black
        :hi cssUnitDecorators guifg=#d8636b
        :hi NvimTreeFolderIcon guifg=#008ae6
        :hi NvimTreeRootFolder guifg=#008ae6
        :hi NvimTreeNormal guibg=none
        :hi NvimTreeNormalNC guibg=none
        :hi NvimTreeFolderName guibg=none
        :hi NvimTreeOpenedFolderName guibg=none
        :hi NvimTreeEmptyFolderName guibg=none
        :hi UndotreeSavedBig guibg=none guifg=#efbd5d
        :hi UndotreeSavedSmall guibg=none
        :hi UndotreeNode guibg=none
        :hi NvimTreeEndOfBuffer guibg=none guifg=Black
        :hi DiagnosticHint guifg=#1b6e6a
        :hi DiagnosticHint guifg=#1b6e6a
        :hi DiagnosticInformation guifg=#6699cc
        :hi DiagnosticVirtualTextWarn guibg=none
        :hi DiagnosticVirtualTextWarning guibg=none guifg=#e0af68
        :hi DiagnosticVirtualTextError guibg=none
        :hi DiagnosticVirtualTextInfo guibg=none
        :hi DiagnosticVirtualTextHint guibg=none
        :hi FloatBorder guibg=none
        :hi DressingHl guibg=none
        :hi Headline guibg=none
        :hi CodeBlock guibg=none

        :hi Pmenu guifg=#C0C5CE guibg=none

        " Telescope
        :hi TelescopeNormal guibg=none
        :hi TelescopeBorder guibg=none

        :hi WhichKeyFloat guibg=#121212

        :hi rainbowcol3 guibg=none guifg=#7aa2f7
        :hi NvimTreeExecFile guifg=#04cf84
      endfunction

      call Colord()
      ]]
      local hl = vim.api.nvim_set_hl
      hl(0, "LeapBackdrop", { link = "Comment" })

      hl(0, "LeapMatch", {
        fg = "white",
        bold = true,
        nocombine = true,
      })

      hl(0, "LeapLabelPrimary", {
        fg = "cyan",
        bold = true,
        nocombine = true,
      })

      hl(0, "LeapLabelSecondary", {
        fg = "#7aa2f7",
        bold = true,
        nocombine = true,
      })
    end,
    dependencies = {
      "nvim-telescope/telescope.nvim",
    },
  },

  {
    "yamatsum/nvim-cursorline",
    event = "VeryLazy",
    config = function()
      require("nvim-cursorline").setup {
        cursorline = {
          enable = true,
          timeout = 4000,
          number = false,
        },
        cursorword = {
          enable = false,
        },
      }
    end,
  },
}
