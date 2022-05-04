" color theme settings
let g:gruvbox_bold = 1
let g:gruvbox_italic = 1
"let g:gruvbox_contrast_dark = "hard"
colorscheme gruvbox

set lazyredraw
set termguicolors
set background=dark

"":hi Normal ctermbg=NONE guibg=NONE
" hi ColorColumn ctermbg=0 guibg=lightgrey " color for the 80 column glutter

" menu colors
hi CmpItemAbbr guifg=#a89984 guibg=#504945
hi CmpItemKind guifg=#d79921 guibg=#504945
hi CmpItemAbbrMatchFuzzy guifg=#ebdbb2 guibg=#504945
hi CmpItemMenu guifg=#000000 guibg=#000000

" autocmd VimEnter * hi Normal ctermbg=none

" " disable background
" highlight Normal     ctermbg=NONE guibg=NONE
" highlight LineNr     ctermbg=NONE guibg=NONE
" highlight SignColumn ctermbg=NONE guibg=NONE

" " Background colors for active vs inactive windows
" " hi ActiveWindow guibg=#17252c
" " hi InactiveWindow guibg=#0D1B22
" hi ActiveWindow guibg=#17252c
" hi InactiveWindow guibg=NONE

" " Call method on window enter
" augroup WindowManagement
"   autocmd!
"   autocmd WinEnter * call Handle_Win_Enter()
" augroup END

" " Change highlight group of active/inactive windows
" function! Handle_Win_Enter()
"   setlocal winhighlight=Normal:ActiveWindow,NormalNC:InactiveWindow
" endfunction
