
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

nnoremap H 5<C-w><
nnoremap L 5<C-w>>

nnoremap <leader>w <C-w>

" folds
nnoremap zo za


" tab indent
xnoremap > >gv
xnoremap < <gv

" which key
" nnoremap <silent> <leader> :WhichKey '<Space>'<CR>

" personal custom
noremap Y "+y

noremap w b
noremap W B
noremap b w
noremap B W

noremap { }
noremap } {
