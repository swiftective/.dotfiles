
lua require('lsp-config')
lua require('compe-config')
lua require('lsp_saga-config')
lua require('lsp_install')
lua require('symbols')

let g:neoformat_try_node_exe = 1
let g:neoformat_basic_format_align = 1
let g:neoformat_basic_format_retab = 1
let g:neoformat_basic_format_trim = 1
let g:neoformat_only_msg_on_error = 1


let g:code_action_menu_show_details = v:false
let g:code_action_menu_show_diff = v:false

" LSP config (the mappings used in the default file don't quite work right)
nnoremap <silent> gd <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> gr <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> K <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent><leader>ca <cmd>CodeActionMenu<CR>

" lsp trouble
nnoremap <leader>tt <cmd>TroubleToggle<cr>
nnoremap <leader>tw <cmd>TroubleToggle lsp_workspace_diagnostics<cr>
nnoremap <leader>td <cmd>TroubleToggle lsp_document_diagnostics<cr>
nnoremap <leader>tq <cmd>TroubleToggle quickfix<cr>
nnoremap <leader>tl <cmd>TroubleToggle loclist<cr>
nnoremap gR <cmd>TroubleToggle lsp_references<cr>

" treesitter
nnoremap <leader>ts :TSPlaygroundToggle<CR>

" Lspsaga
nnoremap <leader>rn :Lspsaga rename<CR>
vnoremap <silent><leader>ca :<C-U>lua require('lspsaga.codeaction').range_code_action()<CR>
nnoremap <silent><leader>cs <cmd>lua require('lspsaga.signaturehelp').signature_help()<CR>
nnoremap <silent> gD <cmd>lua require'lspsaga.provider'.preview_definition()<CR>
nnoremap <silent> gi <cmd>lua require'lspsaga.provider'.lsp_finder()<CR>
nnoremap <silent> gh <cmd>lua require('lspsaga.hover').render_hover_doc()<CR>

nnoremap <silent> <leader>cd :Lspsaga show_line_diagnostics<CR>

nnoremap <silent> <leader>j :Lspsaga diagnostic_jump_next<CR>
nnoremap <silent> <leader>k :Lspsaga diagnostic_jump_prev<CR>
