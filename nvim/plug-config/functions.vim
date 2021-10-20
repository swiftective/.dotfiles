
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
  autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank({timeout = 50})
augroup END

autocmd TermOpen * setlocal nonumber norelativenumber

augroup fmt
  autocmd!
  autocmd BufWritePre * Neoformat
  autocmd BufWritePre * %s/\s\+$//e
  autocmd BufEnter,BufWinEnter,TabEnter *.rs :lua require'lsp_extensions'.inlay_hints{}
augroup END

augroup swiftective
  autocmd!
  autocmd FileType zsh :set filetype=sh
augroup end

augroup vim_conf
  autocmd!
  autocmd BufWinEnter *.vim :TSBufDisable highlight
augroup end

" colorscheme mess
function! Colord()
  :syntax on

  :hi Normal guibg=none
  :hi NvimTreeNormal guibg=none
  :hi IncSearch guibg=#d8636b guifg=white
  :hi LineNr guibg=NONE ctermbg=NONE
  :hi SignColumn guibg=NONE ctermbg=NONE
  :hi EndOfBuffer guibg=NONE ctermbg=NONE guifg=black
  :hi cssUnitDecorators guifg=#d8636b
  :hi GitSignsAdd guibg=none guifg=#27db57
  :hi GitSignsChange guibg=none guifg=#2193de
  :hi GitSignsDelete guibg=none guifg=#d10f3f
  :hi NvimTreeFolderIcon guifg=#008ae6
  :hi VertSplit guibg=none guifg=none


  " buffers
  :hi BufferInactive guibg=none
  :hi BufferTabpageFill guibg=none
  :hi BufferInactiveMod guibg=none
  :hi BufferInactiveSign guibg=none

  " sneak
  :highlight Sneak guifg=black guibg=#00C7DF ctermfg=black ctermbg=cyan
  :highlight SneakScope guifg=red guibg=yellow ctermfg=red ctermbg=yellow

  :hi rainbowcol1 guifg=#d8636b
  :hi rainbowcol2 guifg=#e0bf3a
  :hi rainbowcol3 guifg=#d47c39
  :hi rainbowcol4 guifg=#72db1d
  :hi rainbowcol5 guifg=#1cd4d4
  :hi rainbowcol6 guifg=#5a76cc
  :hi rainbowcol7 guifg=#c685c9
endfunction
