


set termguicolors
set background=dark

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

" buffers
hi BufferInactive guibg=none guifg=gray
hi BufferTabpageFill guibg=none
hi BufferInactiveMod guibg=none
hi BufferInactiveSign guibg=none

" sneak
highlight Sneak guifg=cyan guibg=none ctermfg=cyan ctermbg=none
highlight SneakScope guifg=red guibg=yellow ctermfg=red ctermbg=yellow


hi Pmenu guifg=#C0C5CE guibg=#121212
hi PmenuSel guifg=#343D46 guibg=#C0C5CE

" rainbow brackets
hi rainbowcol1 guifg=#d8636b
hi rainbowcol2 guifg=#e0bf3a
hi rainbowcol3 guifg=#f59842
hi rainbowcol4 guifg=#72db1d
hi rainbowcol5 guifg=#1cd4d4
hi rainbowcol6 guifg=#5a76cc
hi rainbowcol7 guifg=#c685c9
