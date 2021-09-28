" Using Lua functions
nnoremap <leader>ff <cmd>lua require('telescope.builtin').fd()<cr>
nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>
nnoremap <leader>fi <cmd>Telescope builtin<CR>
nnoremap <leader>fo <cmd>Telescope lsp_dynamic_workspace_symbols<CR>
nnoremap <leader>gg <cmd>lua require('telescope.builtin').git_files()<CR>



lua require('telescope-config')
