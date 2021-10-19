set title
set titlestring=\ %-25.55F\ %a%r%m titlelen=70

set clipboard=unnamedplus

set nocompatible
filetype plugin on
syntax on


" set leader to space
:let mapleader = "\<Space>"

" nmap <Enter> o<ESC>
" nmap <S-Enter> O<ESC>
imap jj <Esc>
imap kj <Esc>
imap jk <Esc>

" remap file writing and quit typos
:command WQ wq
:command Wq wq
:command W w
:command Q q

" map ctrl HJKL for movements between windows
" faster than ctrl W then HJKL
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

tnoremap <C-J> <C-\><C-n><C-W><C-J>
tnoremap <C-K> <C-\><C-n><C-W><C-K>
tnoremap <C-L> <C-\><C-n><C-W><C-L>
tnoremap <C-H> <C-\><C-n><C-W><C-H>

" mapping for quickly moving lines
" <A-j> is character ∆
" <A-k> is character ˚
nnoremap ∆ :m .+1<CR>==
nnoremap ˚ :m .-2<CR>==
inoremap ∆ <Esc>:m .+1<CR>==gi
inoremap ˚ <Esc>:m .-2<CR>==gi
vnoremap ∆ :m '>+1<CR>gv=gv
vnoremap ˚ :m '<-2<CR>gv=gv

" mapping for completion  menu navigation
inoremap <expr> <C-j> pumvisible() ? "\<C-N>" : "\<C-j>"
inoremap <expr> <C-k> pumvisible() ? "\<C-P>" : "\<C-k>"

" File tree mappings (using nvimTree for now)
nnoremap <silent> <Leader>pt :NvimTreeToggle<CR>
nnoremap <silent> <Leader>pv :NvimTreeFindFile<CR>

" Telescope
" nnoremap <C-P> :Telescope find_files<CR>
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
nnoremap <leader>fq <cmd>Telescope quickfix<cr>
nnoremap <leader>fl <cmd>Telescope loclist<cr>

nnoremap <C-s> :w<CR>
inoremap <C-s> <ESC>:w<CR>i

" Colorizer toggle mapping
nnoremap <leader>ct <cmd>ColorizerToggle<cr>

" Hop easymotion plugin replacement for neovim
nnoremap <silent> <leader>w :HopWordAC<CR>
nnoremap <silent> <leader>b :HopWordBC<CR>
nnoremap <silent> <leader>j :HopLineAC<CR>
nnoremap <silent> <leader>k :HopLineBC<CR>
nnoremap <silent> <leader>f :HopChar1AC<CR>
nnoremap <silent> <leader>F :HopChar1BC<CR>
nnoremap <silent> <leader>/ :HopPattern<CR>


" fugitive + quicfix list
nnoremap <silent> <space>gg :0Gclog<CR>

" quickfix and location list
nnoremap <silent> <space>co :copen<CR>
nnoremap <silent> <space>cc :cclose<CR>
nnoremap <silent> <space>lo :lopen<CR>
nnoremap <silent> <space>lc :lclose<CR>

" vim-fugitive
nnoremap <silent> <C-g> :Gdiff<CR>

" projectionist
nnoremap <Leader>gt :A<CR>

" reload nvim config
nnoremap <leader>sv :source $MYVIMRC<CR>
map <D-F> /


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


let g:firenvim_config = { 
    \ 'globalSettings': {
        \ 'alt': 'all',
    \  },
    \ 'localSettings': {
        \ '.*': {
            \ 'cmdline': 'neovim',
            \ 'priority': 0,
            \ 'selector': 'textarea',
            \ 'takeover': 'never',
        \ },
    \ }
\ }

let fc = g:firenvim_config['localSettings']
let fc['https?://[^/]+\.co\.uk/'] = { 'takeover': 'never', 'priority': 1 }




set lazyredraw
set termguicolors

"vim surround customization
let g:surround_{char2nr("d")} = "\n{/* \r */}\n"


" set log
"let g:lsp_log_verbose = 1
"let g:lsp_log_file = expand('~/lsp.log')

lua require("ng")


