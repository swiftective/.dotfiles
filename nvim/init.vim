
source $HOME/.config/nvim/plug-config/plug.vim

" Remaps
inoremap jk <Esc>

" leader key
let mapleader = " "

let g:undotree_SetFocusWhenToggle=1


source $HOME/.config/nvim/plug-config/indentline.vim
" source $HOME/.config/nvim/plug-config/statline.vim
source $HOME/.config/nvim/plug-config/functions.vim
source $HOME/.config/nvim/plug-config/tags.vim
" source $HOME/.config/nvim/plug-config/term.vim
source $HOME/.config/nvim/plug-config/coc.vim
source $HOME/.config/nvim/plug-config/coc-snippets.vim
source $HOME/.config/nvim/plug-config/telescope.vim
" source $HOME/.config/nvim/plug-config/easymotion.vim
source $HOME/.config/nvim/plug-config/git.vim
source $HOME/.config/nvim/plug-config/remaps.vim
source $HOME/.config/nvim/plug-config/sets.vim
source $HOME/.config/nvim/plug-config/nvimtree-config.vim
source $HOME/.config/nvim/plug-config/color-scheme.vim


hi NvimTreeFolderIcon guifg=#0099ff


" lua require('stat_lualine')
" lua require('evil_lualine')
lua require('stat_galaxyline')
lua require('git-signs')
lua require('telescope-config')
" lua require('worktree-config')



