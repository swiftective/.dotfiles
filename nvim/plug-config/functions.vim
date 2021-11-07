
function! HandleURL()
  let s:uri = matchstr(getline("."), '[a-z]*:\/\/[^ >,;]*')
  echo s:uri
  if s:uri != ""
    silent exec "!xdg-open '".s:uri."'"
  else
    echo "No URI found in line."
  endif
endfunction
nnoremap <M-u> :call HandleURL()<cr>

augroup highlight_yank
  autocmd!
  autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank({timeout = 60})
augroup END

autocmd TermOpen * setlocal nonumber norelativenumber

augroup fmt
  autocmd!
  autocmd BufWritePre * %s/\s\+$//e
augroup END

augroup swiftective
  autocmd!
  autocmd FileType zsh :set filetype=sh
augroup end

" colorscheme mess
function! Colord()
  :syntax on
  :hi Normal guibg=none
  :hi IncSearch guibg=#d8636b guifg=white
  :hi LineNr guibg=NONE ctermbg=NONE
  :hi SignColumn guibg=NONE ctermbg=NONE
  :hi EndOfBuffer guibg=NONE ctermbg=NONE guifg=black
  :hi cssUnitDecorators guifg=#d8636b
  :hi GitSignsAdd guibg=none guifg=#27db57
  :hi GitSignsChange guibg=none guifg=#2193de
  :hi GitSignsDelete guibg=none guifg=#d10f3f
  :hi NvimTreeFolderIcon guifg=#008ae6
  :hi NvimTreeNormal guibg=none
  :hi VertSplit guifg=Gray10 guibg=none
  :hi NvimTreeNormalNC guibg=none
  :hi NvimTreeFolderName guibg=none
  :hi NvimTreeOpenedFolderName guibg=none
  :hi NvimTreeEmptyFolderName guibg=none
  :hi UndotreeSavedBig guibg=none guifg=Gold
  :hi UndotreeSavedSmall guibg=none
  :hi UndotreeNode guibg=none
  :hi NvimTreeEndOfBuffer guibg=none guifg=black
  :hi LspDiagnosticsDefaultHint guifg=#1b6e6a
  :hi DiagnosticHint guifg=#1b6e6a
  :hi LspDiagnosticsDefaultInformation guifg=#6699cc
  :hi BufferInactive guibg=none guifg=#4e5661
  :hi BufferTabpageFill guibg=none
  :hi BufferInactiveMod guibg=none
  :hi BufferInactiveSign guibg=none
  :hi BufferVisible guibg=none
  :hi BufferVisibleMod guibg=none
  :hi BufferVisibleSign guibg=none
  :hi Sneak guifg=cyan guibg=none ctermfg=Cyan ctermbg=none
  :hi SneakScope guifg=red guibg=Yellow ctermfg=Red ctermbg=yellow
  :hi Pmenu guifg=#C0C5CE guibg=#121212
  :hi rainbowcol1 guifg=#d8636b
  :hi rainbowcol2 guifg=#e0bf3a
  :hi rainbowcol3 guifg=#f59842
  :hi rainbowcol4 guifg=#c685c9
  :hi rainbowcol5 guifg=#5a76cc
  :hi rainbowcol6 guifg=#1cd4d4
  :hi rainbowcol7 guifg=#6A9955
endfunction
