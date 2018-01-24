" nvim-completion-manager config

" Hide completion messages
set shortmess+=c

" Expand ultisnips command with CTRL + U
inoremap <silent> <C-u> <C-r>=cm#sources#ultisnips#trigger_or_popup("\<Plug>(ultisnips_expand)")<CR>

" Expand ultisnips command on enter, or insert a new line instead
imap <expr> <silent> <CR>  (pumvisible() ?  "\<c-y>\<Plug>(expand_or_nl)" : "\<CR>\<C-R>=AutoPairsReturn()\<CR>")
imap <expr> <Plug>(expand_or_nl) (cm#completed_is_snippet() ? "\<C-U>":"\<CR>")
