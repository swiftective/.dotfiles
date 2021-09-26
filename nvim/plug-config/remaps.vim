
" coc explorer
" nnoremap <Leader>e :CocCommand explorer --toggle<CR>

" nvimtree
nnoremap <leader>e :NvimTreeToggle<CR>

" source config
nnoremap <Leader>rc :source $MYVIMRC<CR>

" vim sessions
nnoremap <Leader>o :Telescope lsp_dynamic_workspace_symbols<CR>

" splits
nnoremap <C-w>m :MaximizerToggle<CR>

nnoremap <C-n> :cnext<CR>
nnoremap <C-p> :cprev<CR>

" undo tree
nnoremap <Leader>u :UndotreeToggle<CR>

" git fugitive
nnoremap <leader>gh :diffget //3<CR>
nnoremap <leader>gf :diffget //2<CR>
nnoremap <leader>gs :G<CR>

noremap e b
noremap E B

nnoremap H 5<C-w><
nnoremap L 5<C-w>>

nnoremap <C-j> <C-w>j
nnoremap <C-h> <C-w>h
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" folds
nnoremap zo za

" personal custom
xnoremap Y "+y
nnoremap Y "+yy

" buffers
nnoremap <leader><Tab> :BufferLineCycleNext<CR>
nnoremap <leader><leader><Tab> :BufferLineCyclePrev<CR>
nnoremap <leader>qq :q!<CR>

" treesitter
nnoremap <leader>ts :TSPlaygroundToggle<CR>


" tab indent
xnoremap <Tab> >gv
xnoremap <S-Tab> <gv

" Alias replace all to
" nnoremap <leader>ra :%s//gI<Left><Left><Left>


" which key
" nnoremap <silent> <leader> :WhichKey '<Space>'<CR>

