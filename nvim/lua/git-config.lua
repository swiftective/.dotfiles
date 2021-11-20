vim.cmd [[

" git fugitve toggle function
function FugitiveToggle() abort
  try
    exe filter(getwininfo(), "get(v:val['variables'], 'fugitive_status', v:false) != v:false")[0].winnr .. "wincmd c"
  catch /E684/
    Git
  endtry
endfunction
nnoremap <space>gs <cmd>call FugitiveToggle()<CR>

]]
