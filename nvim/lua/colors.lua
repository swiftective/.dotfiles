vim.g.tokyonight_transparent = true

vim.g.onedark_transparent_background = true
vim.g.onedark_hide_ending_tildes = true
vim.g.onedark_tranparent = true
vim.g.onedark_style = "deep"
vim.g.onedark_toggle_style_keymap = "<nop>"
vim.g.vscode_style = "dark"

vim.cmd [[

" colorscheme mess
function! Colord()
  :syntax on
  :hi BufferCurrentSign guibg=none
  :hi BufferCurrentMod guibg=none
  :hi BufferCurrent guibg=none
  :hi NvimDapVirtualText guifg=#455574 guibg=none gui=bold
  :hi LightspeedShortcutOverlapped guibg=none guifg=Cyan
  :hi Folded guifg=#5c719c guibg=#121212
  :hi CursorLine guibg=#1f262e
  :hi LightspeedShortcut guibg=none guifg=Cyan
  :hi LightspeedOneCharMatch guibg=none guifg=Cyan
  :hi LightspeedLabel guibg=none guifg=Cyan
  :hi BufferCurrentTarget guibg=none guifg=Cyan
  :hi BufferInactiveTarget guibg=none guifg=Cyan
  :hi LightspeedGreyWash guifg=#455574
  :hi IndentBlanklineContextChar guifg=#c7223b
  :hi TSVariable ctermfg=204 guifg=#fa7a84
  :hi IncSearch guibg=Cyan guifg=Black
  :hi LineNr guibg=NONE ctermbg=NONE
  :hi SignColumn guibg=NONE ctermbg=NONE
  :hi EndOfBuffer guibg=NONE ctermbg=NONE guifg=Black
  :hi cssUnitDecorators guifg=#d8636b
  :hi GitSignsAdd guibg=none guifg=#27db57
  :hi GitSignsChange guibg=none guifg=#2193de
  :hi GitSignsDelete guibg=none guifg=#d10f3f
  :hi NvimTreeFolderIcon guifg=#008ae6
  :hi NvimTreeRootFolder guifg=#008ae6
  :hi NvimTreeNormal guibg=none
  :hi NvimTreeNormalNC guibg=none
  :hi VertSplit guifg=Gray10 guibg=none
  :hi NvimTreeFolderName guibg=none
  :hi NvimTreeOpenedFolderName guibg=none
  :hi NvimTreeEmptyFolderName guibg=none
  :hi UndotreeSavedBig guibg=none guifg=#efbd5d
  :hi UndotreeSavedSmall guibg=none
  :hi UndotreeNode guibg=none
  :hi NvimTreeEndOfBuffer guibg=none guifg=Black
  :hi LspDiagnosticsDefaultHint guifg=#1b6e6a
  :hi DiagnosticHint guifg=#1b6e6a
  :hi LspDiagnosticsDefaultInformation guifg=#6699cc
  :hi DiagnosticVirtualTextWarn guibg=none
  :hi DiagnosticVirtualTextWarning guibg=none guifg=#e0af68
  :hi DiagnosticVirtualTextError guibg=none
  :hi DiagnosticVirtualTextInfo guibg=none
  :hi DiagnosticVirtualTextHint guibg=none
  :hi FloatBorder guibg=none
  :hi DressingHl guibg=none
  :hi Headline guibg=none
  :hi CodeBlock guibg=none

  " buffers
  :hi BufferInactive guibg=none guifg=#4e5661
  :hi BufferTabpageFill guibg=none
  :hi BufferInactiveMod guibg=none
  :hi BufferInactiveSign guibg=none
  :hi BufferVisible guibg=none
  :hi BufferVisibleMod guibg=none
  :hi BufferVisibleSign guibg=none
  :hi BufferVisibleTarget guibg=none guifg=cyan

  " sneak
  :hi Sneak guifg=Cyan guibg=none ctermfg=Cyan ctermbg=none
  :hi SneakScope guifg=red guibg=Yellow ctermfg=Red ctermbg=Yellow


  :hi Pmenu guifg=#C0C5CE guibg=#121212

  " rainbow brackets
  :hi rainbowcol1 guifg=#d8636b
  :hi rainbowcol2 guifg=#e0bf3a
  :hi rainbowcol3 guifg=#f59842
  :hi rainbowcol4 guifg=#c685c9
  :hi rainbowcol5 guifg=#5a76cc
  :hi rainbowcol6 guifg=#1cd4d4
  :hi rainbowcol7 guifg=#6A9955

  :hi WhichKeyFloat guibg=none

  :hi Normal guibg=none ctermbg=none
  :hi NvimTreeExecFile guifg=#04cf84
endfunction

colorscheme tokyonight
call Colord()

]]
