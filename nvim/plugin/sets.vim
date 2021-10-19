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
