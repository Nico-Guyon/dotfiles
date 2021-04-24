set title
set titlestring=\ %-25.55F\ %a%r%m titlelen=70

set clipboard=unnamedplus

set nocompatible
filetype plugin on
syntax on


" set leader to space
:let mapleader = "\<Space>"

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

" mapping for quickly moving lines
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv

" mapping for completion  menu navigation
inoremap <expr> <C-j> pumvisible() ? "\<C-N>" : "\<C-j>"
inoremap <expr> <C-k> pumvisible() ? "\<C-P>" : "\<C-k>"


" NERDTree mappings
nnoremap <silent> <Leader>pt :NERDTreeToggle<CR>
nnoremap <silent> <Leader>pv :NERDTreeFind<CR>

" Telescope
" nnoremap <C-P> :Telescope find_files<CR>
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

" Colorizer toggle mapping
nnoremap <leader>ct <cmd>ColorizerToggle<cr>

" Hop easymotion plugin replacement for neovim
nnoremap <silent> <leader>w :HopWord<CR>
nnoremap <silent> <leader>j :HopLine<CR>
nnoremap <silent> <leader>f :HopChar1<CR>
nnoremap <silent> <leader>/ :HopPattern<CR>

" vim-fugitive
nnoremap <silent> <C-g> :Gdiff<CR>

" projectionist
nnoremap <Leader>gt :A<CR>


" completion settings
set completeopt=menuone,noinsert,noselect
set hidden

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

set timeoutlen=1000
set ttimeoutlen=5


highlight ColorColumn ctermbg=0 guibg=lightgrey

call plug#begin('~/.vim/plugged')

    " Vim telescope
    Plug 'nvim-lua/popup.nvim'
    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-telescope/telescope.nvim'
    Plug 'nvim-telescope/telescope-fzy-native.nvim'

    " LSP and completion
    Plug 'neovim/nvim-lspconfig'
    Plug 'hrsh7th/nvim-compe'
    Plug 'hrsh7th/vim-vsnip'
    Plug 'hrsh7th/vim-vsnip-integ'

    " Git
    Plug 'tpope/vim-fugitive' 
    Plug 'Xuyuanp/nerdtree-git-plugin'

    " NerdTree
    Plug 'preservim/nerdtree'
    Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
    Plug 'ryanoasis/vim-devicons'

    " syntax highligh
    " disabled because now using treesitter for highlighting
    Plug 'sheerun/vim-polyglot'

    " hex color code colorizer
    Plug 'norcalli/nvim-colorizer.lua'

    " colorscheme plugins
    " Plug 'rakr/vim-one'
    " Plug 'gosukiwi/vim-atom-dark'
    " Plug 'morhetz/gruvbox'
    " Plug 'joshdick/onedark.vim'
    " Plug 'ghifarit53/tokyonight-vim'
    " Plug 'folke/tokyonight.nvim'
    Plug 'gruvbox-community/gruvbox'


    " text manipulation plugins
    Plug 'tpope/vim-commentary'
    Plug 'tpope/vim-surround'
    Plug 'tpope/vim-abolish'
    Plug 'jiangmiao/auto-pairs'
    Plug 'neoclide/vim-jsx-improve'

    " airline
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'

    " miscs wiki + web browser integration
    Plug 'vimwiki/vimwiki'
    Plug 'glacambre/firenvim', { 'do': { _ -> firenvim#install(0) } }

    " easyMotion / hop for fast movement
    if exists('g:vscode')
        Plug 'Nico-Guyon/vim-vscode-easymotion'
    else
        " Plug 'easymotion/vim-easymotion'
        Plug 'phaazon/hop.nvim'
    endif

    " treesitter 
    Plug 'nvim-treesitter/nvim-treesitter'
    Plug 'nvim-treesitter/nvim-treesitter-textobjects'

    " graphql
    Plug 'jparise/vim-graphql'

    " projectionist
    Plug 'tpope/vim-projectionist'

call plug#end()




set background=dark

let g:gruvbox_bold = 1
let g:gruvbox_italic = 1
let g:gruvbox_contrast_dark = "dark"
" let g:gruvbox_improved_warnings = 1
" let g:gruvbox_improved_strings = 1

" highlight Normal ctermbg=u
" colorscheme one
colorscheme gruvbox
" colorscheme onedark

highlight Normal ctermbg=NONE guibg=NONE

" enable line numbers
let NERDTreeShowLineNumbers=1
" make sure relative line numbers are used
autocmd FileType nerdtree setlocal relativenumber




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


" telescope configuration => using fzy-native
" https://github.com/elianiva/dotfiles/blob/master/nvim/.config/nvim/lua/plugins/_telescope.lua#L58-L63
lua << EOF
local actions = require('telescope.actions')
require('telescope').setup {
    defaults = {
        file_ignore_patterns = {'node_modules'},
        file_sorter = require('telescope.sorters').get_fzy_sorter,
        prompt_prefix = ' >',
        color_devicons = true,

        file_previewer = require('telescope.previewers').vim_buffer_cat.new,
        grep_previewer = require('telescope.previewers').vim_buffer_vimgrep.new,
        qlist_previewer = require('telescope.previewers').vim_buffer_qflist.new,

        mapping = {
            i = {
                ["<C-x>"] = false,
                ["<C-q>"] = actions.send_to_qflist,
                ["<C-u>"] = actions.preview_scrolling_up,
                ["<C-d>"] = actions.preview_scrolling_down,
            },
            n = {
                ["<C-u>"] = actions.preview_scrolling_up,
                ["<C-d>"] = actions.preview_scrolling_down,
            }
        }
    },
    extensions = {
        fzy_native = {
            override_generic_sorter = false,
            override_file_sorter = true,
        }
    }
}
require('telescope').load_extension('fzy_native')

EOF


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

" neovim-lsp configuration
" https://rishabhrd.github.io/jekyll/update/2020/09/19/nvim_lsp_config.html
" https://jose-elias-alvarez.medium.com/configuring-neovims-lsp-client-for-typescript-development-5789d58ea9c

lua require("lsp-config")
lua require("vsnip")

lua <<EOF
require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true
  },
}
EOF

" nvim-colorizer initialization
" lua require'colorizer'.setup()

" temporary disable lsp while easyMotion is enalbed / not working 
autocmd User EasyMotionPromptBegin call lsp#disable()<CR>
autocmd User EasyMotionPromptEnd call lsp#enable()<CR>

" fix nerdTree lag caused by vim-nerdtree-syntax-highlight
" https://github.com/tiagofumo/vim-nerdtree-syntax-highlight/issues/17
let NERDTreeHighlightCursorline = 0
set lazyredraw

" enable airline tabline
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1

set termguicolors

"vim surround customization
let g:surround_{char2nr("d")} = "\n{/* \r */}\n"
