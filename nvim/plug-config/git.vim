
" highlight GitGutterAdd guifg=#009900 ctermfg=Green
" highlight GitGutterChange guifg=#bbbb00 ctermfg=Yellow
" highlight GitGutterDelete guifg=#ff2222 ctermfg=Red

" nmap ) <Plug>(GitGutterNextHunk)
" nmap ( <Plug>(GitGutterPrevHunk)

" let g:gitgutter_enabled = 1
" let g:gitgutter_map_keys = 0
" let g:gitgutter_highlight_linenrs = 1

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
nnoremap <leader>gs :G<CR>

" refresh
nnoremap <leader>gr :Gitsigns refresh<CR>

lua require('git-signs')
