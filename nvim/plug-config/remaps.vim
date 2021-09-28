
" nvimtree
nnoremap <leader>e :NvimTreeToggle<CR>

" source config
nnoremap <Leader>rc :source $MYVIMRC<CR>

" vim sessions
nnoremap <Leader>o :Telescope lsp_dynamic_workspace_symbols<CR>

" splits
nnoremap <leader>wm :MaximizerToggle<CR>

nnoremap <C-n> :cnext<CR>
nnoremap <C-p> :cprev<CR>

" undo tree
nnoremap <Leader>u :UndotreeToggle<CR>

" git fugitive
nnoremap <leader>gh :diffget //3<CR>
nnoremap <leader>gf :diffget //2<CR>
nnoremap <leader>gs :G<CR>

" buffer
nnoremap <silent>>> :BufferLineMoveNext<CR>
nnoremap <silent><< :BufferLineMovePrev<CR>


noremap e b
noremap E B

nnoremap H 5<C-w><
nnoremap L 5<C-w>>

nnoremap <leader>w <C-w>

" folds
nnoremap zo za

" personal custom
xnoremap Y "+y
nnoremap Y "+yy

" buffers
nnoremap <silent><C-k> :BufferLineCycleNext<CR>
nnoremap <silent><C-j> :BufferLineCyclePrev<CR>
nnoremap <leader>qq :q!<CR>

nnoremap <silent><C-l> <C-^>


" treesitter
nnoremap <leader>ts :TSPlaygroundToggle<CR>

" tab indent
xnoremap > >gv
xnoremap < <gv

" Alias replace all to
" nnoremap <leader>ra :%s//gI<Left><Left><Left>


" which key
" nnoremap <silent> <leader> :WhichKey '<Space>'<CR>

noremap # *
noremap * #

noremap { }
noremap } {
