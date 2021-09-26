
lua require('compe-config')
lua require('lsp-config')
lua require('lsp_saga-config')
lua require('lsp_install')

let g:neoformat_enabled_python = ['autopep8', 'yapf', 'docformatter']
let g:neoformat_try_node_exe = 1
let g:neoformat_basic_format_align = 1
let g:neoformat_basic_format_retab = 1
let g:neoformat_basic_format_trim = 1
let g:neoformat_only_msg_on_error = 1

" LSP config (the mappings used in the default file don't quite work right)
nnoremap <silent> gD <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> gR <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> K <cmd>lua vim.lsp.buf.hover()<CR>

" lsp trouble
nnoremap <leader>xx <cmd>TroubleToggle<cr>
nnoremap <leader>xw <cmd>TroubleToggle lsp_workspace_diagnostics<cr>
nnoremap <leader>xd <cmd>TroubleToggle lsp_document_diagnostics<cr>
nnoremap <leader>xq <cmd>TroubleToggle quickfix<cr>
nnoremap <leader>xl <cmd>TroubleToggle loclist<cr>
nnoremap gr <cmd>TroubleToggle lsp_references<cr>

" Lspsaga
nnoremap <leader>rn :Lspsaga rename<CR>
nnoremap <silent><leader>ca <cmd>lua require('lspsaga.codeaction').code_action()<CR>
vnoremap <silent><leader>ca :<C-U>lua require('lspsaga.codeaction').range_code_action()<CR>
nnoremap <silent> K <cmd>lua require('lspsaga.hover').render_hover_doc()<CR>
nnoremap <silent><leader>cs <cmd>lua require('lspsaga.signaturehelp').signature_help()<CR>
nnoremap <silent> gd <cmd>lua require'lspsaga.provider'.preview_definition()<CR>
nnoremap <silent> gi <cmd>lua require'lspsaga.provider'.lsp_finder()<CR>

nnoremap <silent> <C-f> <cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<CR>
nnoremap <silent> <C-b> <cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1)<CR>

nnoremap <silent> <leader>cd :Lspsaga show_line_diagnostics<CR>

nnoremap <silent> <leader>j :Lspsaga diagnostic_jump_next<CR>
nnoremap <silent> <leader>k :Lspsaga diagnostic_jump_prev<CR>

nnoremap <silent> <A-t> :Lspsaga open_floaterm<CR>
tnoremap <silent> <A-t> <C-\><C-n>:Lspsaga close_floaterm<CR>
