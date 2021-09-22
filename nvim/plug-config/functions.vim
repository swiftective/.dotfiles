
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
    autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank({timeout = 40})
augroup END

autocmd TermOpen * setlocal nonumber norelativenumber

