 
" highlight GitGutterAdd guifg=#009900 ctermfg=Green
" highlight GitGutterChange guifg=#bbbb00 ctermfg=Yellow
" highlight GitGutterDelete guifg=#ff2222 ctermfg=Red

" nmap ) <Plug>(GitGutterNextHunk)
" nmap ( <Plug>(GitGutterPrevHunk)

" let g:gitgutter_enabled = 1
" let g:gitgutter_map_keys = 0
" let g:gitgutter_highlight_linenrs = 1

nnoremap <leader>gm :Gitsigns toggle_current_line_blame<CR>

