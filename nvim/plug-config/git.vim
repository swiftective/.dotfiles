
" git blame
nnoremap <leader>gm :Gitsigns toggle_current_line_blame<CR>

" branches
nnoremap <leader>gb <cmd>lua require('telescope.builtin').git_branches()<CR>

" worktree
nnoremap <leader>gw <cmd>lua require('telescope').extensions.git_worktree.git_worktrees()<CR>
nnoremap <leader>gc <cmd>lua require('telescope').extensions.git_worktree.create_git_worktree()<CR>

" git fugitive
nnoremap <leader>gh :diffget //3<CR>
nnoremap <leader>gf :diffget //2<CR>

" refresh
nnoremap <leader>gr :Gitsigns refresh<CR>

" git fugitve toggle function
function FugitiveToggle() abort
  try
    exe filter(getwininfo(), "get(v:val['variables'], 'fugitive_status', v:false) != v:false")[0].winnr .. "wincmd c"
  catch /E684/
    Git
  endtry
endfunction
nnoremap <space>gs <cmd>call FugitiveToggle()<CR>

lua require('git-signs')
