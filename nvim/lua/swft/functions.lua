vim.cmd [[
" git fugitve toggle function
function FugitiveToggle() abort
  try
    exe filter(getwininfo(), "get(v:val['variables'], 'fugitive_status', v:false) != v:false")[0].winnr .. "wincmd c"
  catch /E684/
    Git
  endtry
endfunction

augroup highlight_yank
  autocmd!
  autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank({timeout = 60})
augroup END

autocmd TermOpen * setlocal nonumber norelativenumber

augroup fmt
  autocmd!
  autocmd BufWritePre * %s/\s\+$//e
  autocmd BUfWritePre *.lua lua vim.lsp.buf.formatting_seq_sync()
augroup END

augroup swiftective
  autocmd!
  autocmd FileType zsh :set filetype=sh
  autocmd ColorScheme * call Colord()
augroup end

augroup packer_user_config
  autocmd!
  autocmd BufWritePost packer.lua source <afile> | PackerCompile
augroup end

]]

Swft = {}
Swft.HandleURL = function()
  local url = string.match(vim.fn.getline ".", "[a-z]*://[^ >,;]*")
  if url ~= nil then
    vim.cmd("exec \"!xdg-open '" .. url .. "'\"")
  else
    vim.notify(" No URI found in line. ", "error", { title = debug.getinfo(1, "n").name })
  end
end

return Swft
