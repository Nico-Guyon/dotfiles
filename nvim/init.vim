set shell=/bin/bash

set title
set titlestring=\ %-25.55F\ %a%r%m titlelen=70
" set clipboard=unnamedplus

let g:clipboard = {'copy': {'+': 'pbcopy', '*': 'pbcopy'}, 'paste': {'+': 'pbpaste', '*': 'pbpaste'}, 'name': 'pbcopy', 'cache_enabled': 0}

set clipboard+=unnamedplus

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

" https://vi.stackexchange.com/questions/5128/matchpairs-makes-vim-slow
let g:matchparen_timeout = 2
let g:matchparen_insert_timeout = 2

" reload neovim configuration (don't work for now ...)
if (!exists('*SourceConfig'))
  function SourceConfig() abort
    " Your path will probably be different
    for f in split(glob('~/.config/nvim/autoload/*'), '\n')
      exe 'source' f
    endfor

    source $MYVIMRC
  endfunction
endif

nnoremap <silent> <Leader>r :call SourceConfig()<cr>

" list of nveovim plugins
" https://github.com/rockerBOO/awesome-neovim
call plug#begin('~/.vim/plugged')
    " Vim telescope
    Plug 'nvim-lua/popup.nvim'
    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-telescope/telescope.nvim'
    Plug 'nvim-telescope/telescope-fzy-native.nvim'
    Plug 'kyazdani42/nvim-web-devicons'
    Plug 'nvim-telescope/telescope-hop.nvim'

    " LSP and completion
    Plug 'neovim/nvim-lspconfig'
    Plug 'hrsh7th/cmp-nvim-lsp'
    Plug 'hrsh7th/cmp-buffer'
    Plug 'hrsh7th/nvim-cmp'

    " LSP UI
    " Previsous versions of lspsaga no more maintained anymore
    " Plug 'glepnir/lspsaga.nvim'
    " Plug 'tami5/lspsaga.nvim', { 'branch': 'nvim51' }
    Plug 'tami5/lspsaga.nvim'

    " For vsnip user.
     Plug 'hrsh7th/cmp-vsnip'
     Plug 'hrsh7th/vim-vsnip'

    " Git
    Plug 'tpope/vim-fugitive' 

    " nvim-tree
    Plug 'kyazdani42/nvim-tree.lua'

    " syntax highligh
    " disabled because now using treesitter for highlighting
    " Plug 'sheerun/vim-polyglot'

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

    " . repeat command for plugins
    Plug 'tpope/vim-repeat'

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
    " disabled because was taking too much resources
    " Plug 'andymass/vim-matchup'

    " terminal
    Plug 'norcalli/nvim-terminal.lua'

    " github copilot
    " Plug 'github/copilot.vim'
    " Alternatives versions of copilot => no more used because mainstream
    " copilot now has features that were missing
    " Plug 'hrsh7th/cmp-copilot'
    " alternative github version with next / prev suggestions
    " Plug 'gelfand/copilot.vim'

    " sessions 
    " no more used => was causing too much problems
    " Plug 'Shatur/neovim-session-manager'

call plug#end()

lua require("ng")
