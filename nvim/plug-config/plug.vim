
" Plugins
call plug#begin('~/.local/share/nvim/plugged')

" Color scheme
Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
Plug 'chriskempson/base16-vim'
Plug 'joshdick/onedark.vim'

" git worktree
Plug 'ThePrimeagen/git-worktree.nvim'

" which key
" Plug 'liuchengxu/vim-which-key'

" colors
Plug 'norcalli/nvim-colorizer.lua'

" outline
Plug 'simrat39/symbols-outline.nvim'

" statusline
Plug 'hoob3rt/lualine.nvim'

" git features
Plug 'tpope/vim-fugitive'
Plug 'junegunn/gv.vim'
Plug 'lewis6991/gitsigns.nvim'


" undotree
Plug 'mbbill/undotree'

" telescope (fuzzy finder)
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'
Plug 'nvim-lua/plenary.nvim'

" motion
Plug 'justinmk/vim-sneak'

" treesitter
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'nvim-treesitter/playground'

Plug 'p00f/nvim-ts-rainbow'

" comments
Plug 'tpope/vim-commentary'

" emmet
Plug 'mattn/emmet-vim'

" indentLine
Plug 'Yggdroot/indentLine'

" auto complete and other features
Plug 'alvan/vim-closetag'
Plug 'tpope/vim-surround'
Plug 'jiangmiao/auto-pairs'


" lsp
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-nvim-lua'
Plug 'onsails/lspkind-nvim'
Plug 'folke/lsp-colors.nvim'

" lspinstall
Plug 'williamboman/nvim-lsp-installer'

Plug 'antoinemadec/FixCursorHold.nvim'

" Plug 'hrsh7th/cmp-vsnip'
" Plug 'hrsh7th/vim-vsnip'

" For ultisnips user.
Plug 'SirVer/ultisnips'
Plug 'quangnguyen30192/cmp-nvim-ultisnips'

Plug 'honza/vim-snippets'

Plug 'glepnir/lspsaga.nvim'
Plug 'folke/trouble.nvim'


" terminal
Plug 'akinsho/toggleterm.nvim'

" Good looking stuff in vim
Plug 'kyazdani42/nvim-web-devicons'

" To add the . functionality to other plugins
Plug 'tpope/vim-repeat'

" bufferline for asthetics
Plug 'romgrk/barbar.nvim'


" file tree
Plug 'kyazdani42/nvim-tree.lua'

" neoformat
Plug 'sbdchd/neoformat'

Plug 'szw/vim-maximizer'

" easy motion
" Plug 'easymotion/vim-easymotion'


" vim multi cursors
Plug 'mg979/vim-visual-multi', {'branch': 'master'}

" games
Plug 'ThePrimeagen/vim-be-good'

" Session management
Plug 'tpope/vim-obsession'

call plug#end()



