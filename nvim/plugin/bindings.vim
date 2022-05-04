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

" window navigation

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

nnoremap <silent> <leader>1 :1wincmd w <cr>
nnoremap <silent> <leader>2 :2wincmd w <cr>
nnoremap <silent> <leader>3 :3wincmd w <cr>
nnoremap <silent> <leader>4 :4wincmd w <cr>
nnoremap <silent> <leader>5 :5wincmd w <cr>
nnoremap <silent> <leader>6 :6wincmd w <cr>
nnoremap <silent> <leader>7 :7wincmd w <cr>
nnoremap <silent> <leader>8 :8wincmd w <cr>
nnoremap <silent> <leader>9 :9wincmd w <cr>
nnoremap <silent> <leader>0 :0wincmd w <cr>

nnoremap <silent> <C-W>b <C-W>v<C-W>v<C-W>v
nnoremap <silent> <C-W><C-b> <C-W>v<C-W>v<C-W>v

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
nnoremap <leader>fdw <cmd>Telescope lsp_workspace_diagnostics<cr>
nnoremap <leader>fdd <cmd>Telescope lsp_document_diagnostics<cr>

nnoremap <C-s> :w<CR>
inoremap <C-s> <ESC>:w<CR>

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


" vim-fugitive toggle
" https://www.reddit.com/r/vim/comments/njtmpy/help_toggle_fugitive_git_command_with_nnormap/
" https://gist.github.com/actionshrimp/6493611
function! ToggleGStatus()
    if buflisted(bufname('.git/index'))
        bd .git/index
    else
        Git
    endif
endfunction
command ToggleGStatus :call ToggleGStatus()

nmap <silent>gq :ToggleGStatus<CR>

" Jump forward or backward
imap <expr> <Tab>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>'
smap <expr> <Tab>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>'
imap <expr> <S-Tab> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'
smap <expr> <S-Tab> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'

" coplilot
" <A-[> is character “
" <A-]> is character ‘
imap “ <Plug>(copilot-previous)
imap ‘ <Plug>(copilot-next)
