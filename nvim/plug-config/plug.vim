
" Plugins
call plug#begin('~/.local/share/nvim/plugged')

" Color scheme
Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
Plug 'navarasu/onedark.nvim'

" git worktree
Plug 'ThePrimeagen/git-worktree.nvim'


Plug 'lewis6991/impatient.nvim'

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
Plug 'tzachar/cmp-tabnine', { 'do': './install.sh' }
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-nvim-lua'
Plug 'onsails/lspkind-nvim'
Plug 'folke/lsp-colors.nvim'
Plug 'weilbith/nvim-code-action-menu'

" lspinstall
Plug 'williamboman/nvim-lsp-installer'

Plug 'antoinemadec/FixCursorHold.nvim'

" For luasnip users.
Plug 'L3MON4D3/LuaSnip'
Plug 'saadparwaiz1/cmp_luasnip'
Plug 'rafamadriz/friendly-snippets'

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

" vim multi cursors
Plug 'mg979/vim-visual-multi', {'branch': 'master'}

" games
Plug 'ThePrimeagen/vim-be-good'

" Session management
Plug 'tpope/vim-obsession'

call plug#end()



