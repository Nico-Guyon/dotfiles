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
