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


" completion settings
set completeopt=menu,menuone,noselect
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
        file_ignore_patterns = {'node_modules', '%.png', '%.ttf', '%.jpg'},
        file_sorter = require('telescope.sorters').get_fzy_sorter,
         vimgrep_arguments = {
             'rg',
             '--color=never',
             '--no-heading',
             '--with-filename',
             '--line-number',
             '--column',
             '--smart-case'
         },

        prompt_prefix = ' >',
        color_devicons = true,

        file_previewer = require('telescope.previewers').vim_buffer_cat.new,
        grep_previewer = require('telescope.previewers').vim_buffer_vimgrep.new,
        qlist_previewer = require('telescope.previewers').vim_buffer_qflist.new,

        mappings = {
            i = {
                ["<C-x>"] = false,
                ["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
                ["<C-l>"] = actions.send_to_loclist + actions.open_loclist,
                ["<C-u>"] = actions.preview_scrolling_up,
                ["<C-d>"] = actions.preview_scrolling_down,
                ["<C-j>"] = actions.move_selection_next,
                ["<C-k>"] = actions.move_selection_previous,
            },
            n = {
                ["<C-u>"] = actions.preview_scrolling_up,
                ["<C-d>"] = actions.preview_scrolling_down,
                ["<C-j>"] = actions.move_selection_next,
                ["<C-k>"] = actions.move_selection_previous,
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


" neovim-lsp configuration
" https://rishabhrd.github.io/jekyll/update/2020/09/19/nvim_lsp_config.html
" https://jose-elias-alvarez.medium.com/configuring-neovims-lsp-client-for-typescript-development-5789d58ea9c
set lazyredraw

" enable airline tabline
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1

set termguicolors

"vim surround customization
let g:surround_{char2nr("d")} = "\n{/* \r */}\n"


" https://github.com/vim-airline/vim-airline/issues/421
let g:airline_extensions = []

" close tags

let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*.tsx'
" let g:closetag_xhtml_filenames = '*.xhtml,*.jsx,*.tsx'
let g:closetag_regions =  {
\ 'typescript.tsx': 'jsxRegion,tsxRegion',
\ 'javascript.jsx': 'jsxRegion',
\ }"


""" filenames like *.xml, *.html, *.xhtml, ...
"" These are the file extensions where this plugin is enabled.
""
"let g:closetag_filenames = '*.html,*.xhtml,*.phtml'

"" filenames like *.xml, *.xhtml, ...
"" This will make the list of non-closing tags self-closing in the specified files.
""
"let g:closetag_xhtml_filenames = '*.xhtml,*.jsx,*.tsx'

"" filetypes like xml, html, xhtml, ...
"" These are the file types where this plugin is enabled.
""
"let g:closetag_filetypes = 'html,xhtml,phtml'

"" filetypes like xml, xhtml, ...
"" This will make the list of non-closing tags self-closing in the specified files.
""
"let g:closetag_xhtml_filetypes = 'xhtml,jsx,tsx'

"" integer value [0|1]
"" This will make the list of non-closing tags case-sensitive (e.g. `<Link>` will be closed while `<link>` won't.)
""
"let g:closetag_emptyTags_caseSensitive = 1

"" dict
"" Disables auto-close if not in a "valid" region (based on filetype)
""
"" let g:closetag_regions = {
""     \ 'typescript.tsx': 'jsxRegion,tsxRegion',
""     \ 'javascript.jsx': 'jsxRegion',
""     \ 'typescriptreact': 'jsxRegion,tsxRegion',
""     \ 'javascriptreact': 'jsxRegion',
""     \ }

"" Shortcut for closing tags, default is '>'
""
"let g:closetag_shortcut = '>'

"" Add > at current position without closing the current tag, default is ''
""
"let g:closetag_close_shortcut = '<leader>>'



" async lsp finder
nnoremap <silent>gR <cmd>lua require'lspsaga.provider'.lsp_finder()<CR>

" code action
nnoremap <silent>ga <cmd>lua require('lspsaga.codeaction').code_action()<CR>
vnoremap <silent>ga :<C-U>lua require('lspsaga.codeaction').range_code_action()<CR>

" hover doc
nnoremap <silent> gh <cmd>lua require('lspsaga.hover').render_hover_doc()<CR>
nnoremap <silent> <C-f> <cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<CR>
nnoremap <silent> <C-b> <cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1)<CR>

" signature help
nnoremap <silent>gs <cmd>lua require('lspsaga.signaturehelp').signature_help()<CR>

" rename 
nnoremap <silent>gr <cmd>lua require('lspsaga.rename').rename()<CR>

" Preview Definition
nnoremap <silent>gD <cmd>lua require'lspsaga.provider'.preview_definition()<CR>

" Jump Diagnostic and Show Diagnostics 
nnoremap <silent><leader>a <cmd>lua require'lspsaga.diagnostic'.show_line_diagnostics()<CR>
" nnoremap <silent><leader>cc <cmd>lua require'lspsaga.diagnostic'.show_cursor_diagnostics()<CR>
nnoremap <silent> [e <cmd>lua require'lspsaga.diagnostic'.lsp_jump_diagnostic_prev()<CR>
nnoremap <silent> ]e <cmd>lua require'lspsaga.diagnostic'.lsp_jump_diagnostic_next()<CR>



" lua vim.lsp.handlers["textDocument/publishDiagnostics"] = function() end



"let g:lsp_log_verbose = 1
"let g:lsp_log_file = expand('~/lsp.log')

lua require("ng")


