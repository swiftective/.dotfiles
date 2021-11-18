vim.cmd [[
" main remap
inoremap jk <Esc>

" nvimtree
nnoremap <leader>e :NvimTreeToggle<CR>

" source config
nnoremap <Leader>rc :source $MYVIMRC<CR>

" vim sessions
nnoremap <Leader>o :SymbolsOutline<CR>

" splits
nnoremap <leader>wm :MaximizerToggle<CR>

nnoremap <leader>n :cnext<CR>
nnoremap <leader>p :cprevious<CR>

" undo tree
nnoremap <Leader>u :UndotreeToggle<CR>

tnoremap <A-s> <C-\><C-n>

nnoremap <leader>qq :q!<CR>
nnoremap <silent><C-l> <C-^>

nnoremap <leader>w< 5<C-w><
nnoremap <leader>w> 5<C-w>>

noremap L $
noremap H 0

nnoremap <leader>w <C-w>

" folds
nnoremap zo za

noremap <C-f> <C-u>

" tab indent
xnoremap > >gv
xnoremap < <gv

" which key
" nnoremap <silent> <leader> :WhichKey '<Space>'<CR>

" personal custom
noremap Y "+y

inoremap <C-v> <C-r>"

map ; <Plug>Lightspeed_;_sx
map , <Plug>Lightspeed_,_sx
map ; <Plug>Lightspeed_;_ft
map , <Plug>Lightspeed_,_ft
]]
