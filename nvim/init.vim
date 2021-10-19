set title
set titlestring=\ %-25.55F\ %a%r%m titlelen=70
set clipboard=unnamedplus

set nocompatible
filetype plugin on
syntax on

" completion settings
set completeopt=menu,menuone,noselect
set hidden
set scrolloff=8

" column configuration
set signcolumn=yes
set colorcolumn=80

" line numbers
set relativenumber
set number

" search highlighting
set nohlsearch " don't highligh searched terms
set incsearch " highligh as searching

set noerrorbells

" tab managment
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent

set nowrap " don't allow text wrapping
set smartcase
set noswapfile
set nobackup

set undodir=~/.vim/undodir
set undofile

" apparently having longer update time leads to poor user experience
set updatetime=50 
set timeoutlen=1000
set ttimeoutlen=5

call plug#begin('~/.vim/plugged')

    " Vim telescope
    Plug 'nvim-lua/popup.nvim'
    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-telescope/telescope.nvim'
    Plug 'nvim-telescope/telescope-fzy-native.nvim'
    Plug 'kyazdani42/nvim-web-devicons'

    " LSP and completion
    Plug 'neovim/nvim-lspconfig'
    Plug 'hrsh7th/cmp-nvim-lsp'
    Plug 'hrsh7th/cmp-buffer'
    Plug 'hrsh7th/nvim-cmp'

    " For vsnip user.
    Plug 'hrsh7th/cmp-vsnip'
    Plug 'hrsh7th/vim-vsnip'
    "Plug 'glepnir/lspsaga.nvim'
    Plug 'tami5/lspsaga.nvim', { 'branch': 'nvim51' }

    " Git
    Plug 'tpope/vim-fugitive' 

    " nvim-tree
    Plug 'kyazdani42/nvim-tree.lua'

    " syntax highligh
    " disabled because now using treesitter for highlighting
    Plug 'sheerun/vim-polyglot'

    " hex color code colorizer
    Plug 'norcalli/nvim-colorizer.lua'

    " colorscheme plugins
    Plug 'gruvbox-community/gruvbox'


    " text manipulation plugins
    Plug 'tpope/vim-commentary'
    Plug 'tpope/vim-surround'
    Plug 'tpope/vim-abolish'
    Plug 'windwp/nvim-autopairs'
    Plug 'neoclide/vim-jsx-improve'
    Plug 'alvan/vim-closetag'

    " miscs wiki + web browser integration
    Plug 'vimwiki/vimwiki'
    Plug 'glacambre/firenvim', { 'do': { _ -> firenvim#install(0) } }

    " easyMotion / hop for fast movement
    if exists('g:vscode')
        Plug 'Nico-Guyon/vim-vscode-easymotion'
    else
        Plug 'phaazon/hop.nvim'
    endif

    " treesitter 
    Plug 'nvim-treesitter/nvim-treesitter'
    Plug 'nvim-treesitter/nvim-treesitter-textobjects'
    Plug 'nvim-treesitter/playground'
    Plug 'JoosepAlviste/nvim-ts-context-commentstring'

    " graphql
    Plug 'jparise/vim-graphql'

    " projectionist
    Plug 'tpope/vim-projectionist'

    " matching commands
    Plug 'tpope/vim-unimpaired'
    
    " better matchit plugin for % key
    Plug 'andymass/vim-matchup'

    " terminal
    Plug 'norcalli/nvim-terminal.lua'

call plug#end()

"vim surround customization
let g:surround_{char2nr("d")} = "\n{/* \r */}\n"

" set log
"let g:lsp_log_verbose = 1
"let g:lsp_log_file = expand('~/lsp.log')

lua require("ng")
