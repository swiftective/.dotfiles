-- Automatically update diagnostics
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
  underline = true,
  update_in_insert = true,
  virtual_text = { spacing = 4, prefix = "●" },
  severity_sort = true,
})

local signs = { Error = " ", Warning = " ", Hint = " ", Information = " " }

for type, icon in pairs(signs) do
  local hl = "LspDiagnosticsSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

require "compe-config"
require "lsp_install"

vim.g["neoformat_try_node_exe"] = 1
vim.g["neoformat_basic_format_align"] = 1
vim.g["neoformat_basic_format_retab"] = 1
vim.g["neoformat_basic_format_trim"] = 1
vim.g["neoformat_only_msg_on_error"] = 1

vim.cmd [[


" LSP config (the mappings used in the default file don't quite work right)
nnoremap <silent> gd <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> gR <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> K <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent><leader>ca <cmd>Telescope lsp_code_actions theme=cursor<CR>

" lsp trouble
nnoremap <leader>tt <cmd>TroubleToggle<cr>
nnoremap <leader>tw <cmd>TroubleToggle lsp_workspace_diagnostics<cr>
nnoremap <leader>td <cmd>TroubleToggle lsp_document_diagnostics<cr>
nnoremap <leader>tq <cmd>TroubleToggle quickfix<cr>
nnoremap <leader>tl <cmd>TroubleToggle loclist<cr>
nnoremap gr <cmd>TroubleToggle lsp_references<cr>

" treesitter
nnoremap <leader>ts :TSPlaygroundToggle<CR>

" LSP custom functions
nnoremap <leader>rn <cmd>lua require("rv.lsp.rename").rename()<CR>
nnoremap <silent> gD <cmd>lua require'rv.lsp.provider'.preview_definition()<CR>
nnoremap <silent> <leader>cd <cmd>lua require("rv.lsp.diagnostic").show_line_diagnostics()<CR>
nnoremap <silent> <leader>j <cmd>lua require("rv.lsp.diagnostic").lsp_jump_diagnostic_next()<CR>
nnoremap <silent> <leader>k <cmd>lua require("rv.lsp.diagnostic").lsp_jump_diagnostic_prev()<CR>

]]
