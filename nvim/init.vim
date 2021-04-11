set title
set titlestring=\ %-25.55F\ %a%r%m titlelen=70

set clipboard=unnamedplus

set nocompatible
filetype plugin on
syntax on

nmap <Enter> o<ESC>
nmap <S-Enter> O<ESC>
imap jj <Esc>
imap kj <Esc>
imap jk <Esc>

" map ctrl HJKL for movements between windows
" faster than ctrl W then HJKL
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

map <D-F> /

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


highlight ColorColumn ctermbg=0 guibg=lightgrey

call plug#begin('~/.vim/plugged')


    Plug 'nvim-telescope/telescope.nvim'

    Plug 'sheerun/vim-polyglot'

    Plug 'kien/ctrlp.vim'
    Plug 'rakr/vim-one'
    Plug 'gosukiwi/vim-atom-dark'
    " Plug 'morhetz/gruvbox'
    Plug 'gruvbox-community/gruvbox'
    Plug 'joshdick/onedark.vim'
    Plug 'preservim/nerdtree'
    Plug 'tpope/vim-commentary'
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'tpope/vim-surround'
    Plug 'tpope/vim-fugitive' 
    " Plug 'puremourning/vimspector'
    Plug 'tpope/vim-abolish'
    Plug 'vimwiki/vimwiki'

    if exists('g:vscode')
        Plug 'Nico-Guyon/vim-vscode-easymotion'
    else
        Plug 'easymotion/vim-easymotion'
    endif


    Plug 'glacambre/firenvim', { 'do': { _ -> firenvim#install(0) } }

   
    Plug 'nvim-treesitter/nvim-treesitter'
    Plug 'nvim-treesitter/nvim-treesitter-textobjects'

call plug#end()

let g:gruvbox_contrast_dark = "hard"
" highlight Normal ctermbg=u
" colorscheme one
colorscheme gruvbox
" colorscheme onedark

set background=dark
highlight Normal ctermbg=NONE guibg=NONE

" enable line numbers
let NERDTreeShowLineNumbers=1
" make sure relative line numbers are used
autocmd FileType nerdtree setlocal relativenumber

:let mapleader = "\<Space>"
map <Leader> <Plug>(easymotion-prefix)



if exists('g:vscode')
    xmap gc  <Plug>VSCodeCommentary
    nmap gc  <Plug>VSCodeCommentary
    omap gc  <Plug>VSCodeCommentary
    nmap gcc <Plug>VSCodeCommentaryLine

    nnoremap <leader><leader> <Cmd>call VSCodeNotify('editor.debug.action.toggleBreakpoint')<CR>

    nnoremap <leader>r <Cmd>call VSCodeNotify('workbench.action.debug.start')<CR>
    nnoremap <leader>s <Cmd>call VSCodeNotify('workbench.action.debug.stop')<CR>
    nnoremap <leader>c <Cmd>call VSCodeNotify('workbench.action.debug.continue')<CR>
    nnoremap <leader>o <Cmd>call VSCodeNotify('workbench.action.debug.stepOver')<CR>
    nnoremap <leader>i <Cmd>call VSCodeNotify('workbench.action.debug.stepInto')<CR>
    nnoremap <leader>h <Cmd>call VSCodeNotify('editor.debug.action.showDebugHover ')<CR>

    nnoremap <C-W>o <Cmd>call VSCodeNotify('workbench.action.closeEditorsInOtherGroups')<CR>

endif


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

"vimwiki config
let g:vimwiki_map_prefix = '<Leader>x'
let g:vimwiki_list = [{'path': '~/Google Drive/vimwiki',
                      \ 'syntax': 'default',
                      \ 'ext': '.md',
                      \ 'auto_diary_index': 1}]

" vimwiki configuration
"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (empty($TMUX))
  if (has("nvim"))
    "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
endif




lua <<EOF
require'nvim-treesitter.configs'.setup {
  textobjects = {
    select = {
      enable = true,
      keymaps = {
        -- You can use the capture groups defined in textobjects.scm
        ["af"] = "@function.outer",
        ["if"] = "@function.inner",
        ["ac"] = "@class.outer",
        ["ic"] = "@class.inner",

        -- Or you can define your own textobjects like this
        ["iF"] = {
          python = "(function_definition) @function",
          cpp = "(function_definition) @function",
          c = "(function_definition) @function",
          java = "(method_declaration) @function",
        },
      },
    },
  },
}
EOF



