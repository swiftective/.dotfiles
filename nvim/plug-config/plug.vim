
" Plugins
call plug#begin('~/.local/share/nvim/plugged')

" Color scheme 
" Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
Plug 'chriskempson/base16-vim'
" Plug 'yashguptaz/calvera-dark.nvim'
" Plug 'mhartington/oceanic-next'
" Plug 'arcticicestudio/nord-vim'
" Plug 'joshdick/onedark.vim'
" Plug 'ghifarit53/tokyonight-vim'
" Plug 'morhetz/gruvbox'
" Plug 'marko-cerovac/material.nvim'
" Plug 'gruvbox-community/gruvbox'

" git worktree
Plug 'ThePrimeagen/git-worktree.nvim'

" which key 
" Plug 'liuchengxu/vim-which-key'


" statusline
Plug 'glepnir/galaxyline.nvim' , {'branch': 'main'}
" Plug 'famiu/feline.nvim'
" Plug 'hoob3rt/lualine.nvim'
" Plug 'vim-airline/vim-airline'
" Plug 'vim-airline/vim-airline-themes'

" git features 
" Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
" Plug 'rhysd/git-messenger.vim'
Plug 'lewis6991/gitsigns.nvim'


" undotree
Plug 'mbbill/undotree'



" telescope (fuzzy finder)
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'
Plug 'nvim-lua/plenary.nvim'


" treesitter
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'nvim-treesitter/playground'

" comments
Plug 'tpope/vim-commentary'

" emmet
Plug 'mattn/emmet-vim'

" indentLine
Plug 'Yggdroot/indentLine'

" auto complete and other features
Plug 'alvan/vim-closetag'
Plug 'tpope/vim-surround'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'honza/vim-snippets'

" terminal
" Plug 'voldikss/vim-floaterm'

" Good looking stuff in vim 
Plug 'kyazdani42/nvim-web-devicons'
Plug 'ryanoasis/vim-devicons' " vimscript

" To add the . functionality to other plugins
Plug 'tpope/vim-repeat'

" bufferline for asthetics
Plug 'akinsho/bufferline.nvim'

" file tree 
Plug 'kyazdani42/nvim-tree.lua'

" easy motion
" Plug 'easymotion/vim-easymotion'


" Trying new plugins
" Plug 'easymotion/vim-easymotion'
" Plug 'mg979/vim-visual-multi', {'branch': 'master'}


" Session management 
Plug 'tpope/vim-obsession'

call plug#end()



