
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

augroup zsh_conf
  autocmd!
  autocmd FileType zsh :set filetype=sh
augroup end

augroup vim_conf
  autocmd!
  autocmd FileType vim :TSBufDisable highlight
augroup end

" colorscheme mess
function! Colord()
  syntax on
  :hi Normal guibg=none
  :hi LineNr guibg=NONE ctermbg=NONE
  :hi NvimTreeFolderIcon guifg=#008ae6
  :hi SignColumn guibg=NONE ctermbg=NONE
  :hi EndOfBuffer guibg=NONE ctermbg=NONE guifg=black
  :hi GitSignsAdd guibg=none guifg=#27db57
  :hi GitSignsChange guibg=none guifg=#2193de
  :hi GitSignsDelete guibg=none guifg=#d10f3f
  :hi VertSplit guibg=none guifg=none
  :hi BufferLineBackground guibg=#000000
  :hi BufferLineCloseButton guibg=#000000
  :hi BufferLineCloseButtonSelected guibg=#000000
  :hi BufferLineBufferSelected guibg=#000000
  :hi BufferLineSeparator guibg=#000000
  :hi BufferLineSeparatorSelected guibg=#000000
  :hi BufferLineGroupSeparator guibg=#000000
  :hi BufferLineWarningDiagnostic guibg=#000000
  :hi BufferLineIndicatorSelected guibg=#000000
  :hi BufferLineModified guibg=#000000
  :hi BufferLineWarning guibg=#000000
  :hi BufferLineWarningSelected guibg=#000000
  :hi BufferLineError guibg=#000000
  :hi BufferLineErrorSelected guibg=#000000
  :hi BufferLineModifiedSelected guibg=#000000
  :hi BufferLineInfo guibg=#000000
  :hi BufferLineInfoSelected guibg=#000000
  :hi BufferLineDevIconDefault guibg=#000000
  :hi BufferLineFill guibg=#000000
  :hi BufferLineDevIconDefaultSelected guibg=#000000
  :hi rainbowcol1 guifg=#d8636b
  :hi rainbowcol2 guifg=#e0bf3a
  :hi rainbowcol3 guifg=#d47c39
  :hi rainbowcol4 guifg=#72db1d
  :hi rainbowcol5 guifg=#1cd4d4
  :hi rainbowcol6 guifg=#5a76cc
  :hi rainbowcol7 guifg=#c685c9
endfunction
