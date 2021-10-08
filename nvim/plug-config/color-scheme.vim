


set termguicolors

let base16colorspace=256  " Access colors present in 256 colorspace
" colorscheme base16-default-dark
" colorscheme base16-tomorrow-night
let g:tokyonight_style = "night"
let g:tokyonight_transparent = "true"
colorscheme onedark

syntax on
hi Normal guibg=none
hi IncSearch guibg=#d8636b guifg=white
hi LineNr guibg=NONE ctermbg=NONE
hi SignColumn guibg=NONE ctermbg=NONE
hi EndOfBuffer guibg=NONE ctermbg=NONE guifg=black
hi cssUnitDecorators guifg=#d8636b
hi GitSignsAdd guibg=none guifg=#27db57
hi GitSignsChange guibg=none guifg=#2193de
hi GitSignsDelete guibg=none guifg=#d10f3f
hi NvimTreeFolderIcon guifg=#008ae6
hi VertSplit guibg=none guifg=none

" bufferine
hi BufferLineBackground guibg=#000000
hi BufferLineCloseButton guibg=#000000
hi BufferLineCloseButtonSelected guibg=#000000
hi BufferLineBufferSelected guibg=#000000
hi BufferLineSeparator guibg=#000000
hi BufferLineSeparatorSelected guibg=#000000
hi BufferLineGroupSeparator guibg=#000000
hi BufferLineWarningDiagnostic guibg=#000000
hi BufferLineIndicatorSelected guibg=#000000
hi BufferLineModified guibg=#000000
hi BufferLineWarning guibg=#000000
hi BufferLineWarningSelected guibg=#000000
hi BufferLineError guibg=#000000
hi BufferLineErrorSelected guibg=#000000
hi BufferLineModifiedSelected guibg=#000000
hi BufferLineInfo guibg=#000000
hi BufferLineInfoSelected guibg=#000000
hi BufferLineDevIconDefault guibg=#000000
hi BufferLineFill guibg=#000000
hi BufferLineDevIconDefaultSelected guibg=#000000

" rainbow brackets
hi rainbowcol1 guifg=#d8636b
hi rainbowcol2 guifg=#e0bf3a
hi rainbowcol3 guifg=#f59842
hi rainbowcol4 guifg=#72db1d
hi rainbowcol5 guifg=#1cd4d4
hi rainbowcol6 guifg=#5a76cc
hi rainbowcol7 guifg=#c685c9
