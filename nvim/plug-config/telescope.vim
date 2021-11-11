" Using Lua functions
nnoremap <leader>fd <cmd>lua require('telescope.builtin').fd()<cr>
nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>
nnoremap <leader>fo <cmd>Telescope lsp_dynamic_workspace_symbols<CR>
nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<CR>
noremap <C-p> <cmd>lua require('telescope.builtin').git_files()<CR>
noremap <A-p> <cmd>Telescope builtin<CR>


lua require('telescope-config')
