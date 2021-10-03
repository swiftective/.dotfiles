
" nvimtree
nnoremap <leader>e :NvimTreeToggle<CR>

" source config
nnoremap <Leader>rc :source $MYVIMRC<CR>

" vim sessions
nnoremap <Leader>o :SymbolsOutline<CR>

" splits
nnoremap <leader>wm :MaximizerToggle<CR>

nnoremap <C-n> :cnext<CR>
nnoremap <C-p> :cprev<CR>

" undo tree
nnoremap <Leader>u :UndotreeToggle<CR>

" buffer
nnoremap <silent>>> :BufferLineMoveNext<CR>
nnoremap <silent><< :BufferLineMovePrev<CR>
" nnoremap <silent><leader>a :BufferLinePick<CR>

tnoremap <A-s> <C-\><C-n>


nnoremap H 5<C-w><
nnoremap L 5<C-w>>

nnoremap <leader>w <C-w>

" folds
nnoremap zo za


" buffers
nnoremap <silent><C-k> :BufferLineCycleNext<CR>
nnoremap <silent><C-j> :BufferLineCyclePrev<CR>
nnoremap <leader>qq :q!<CR>

nnoremap <silent><C-l> <C-^>

" buffers
nnoremap <silent><leader>1 <Cmd>BufferLineGoToBuffer 1<CR>
nnoremap <silent><leader>2 <Cmd>BufferLineGoToBuffer 2<CR>
nnoremap <silent><leader>3 <Cmd>BufferLineGoToBuffer 3<CR>
nnoremap <silent><leader>4 <Cmd>BufferLineGoToBuffer 4<CR>
nnoremap <silent><leader>5 <Cmd>BufferLineGoToBuffer 5<CR>
nnoremap <silent><leader>6 <Cmd>BufferLineGoToBuffer 6<CR>
nnoremap <silent><leader>7 <Cmd>BufferLineGoToBuffer 7<CR>
nnoremap <silent><leader>8 <Cmd>BufferLineGoToBuffer 8<CR>
nnoremap <silent><leader>9 <Cmd>BufferLineGoToBuffer 9<CR>

" tab indent
xnoremap > >gv
xnoremap < <gv

" which key
" nnoremap <silent> <leader> :WhichKey '<Space>'<CR>

" personal custom
xnoremap Y "+y
nnoremap Y "+yy

noremap e b
noremap E B

onoremap f t
onoremap F T
onoremap t f
onoremap T F

noremap { }
noremap } {
