" nvim-completion-manager config

" Hide completion messages
set shortmess+=c

" Expand ultisnips command with CTRL + U
inoremap <silent> <C-u> <C-r>=cm#sources#ultisnips#trigger_or_popup("\<Plug>(ultisnips_expand)")<CR>

" Expand ultisnips command on enter, or insert a new line instead
imap <expr> <silent> <CR>  (pumvisible() ?  "\<c-y>\<Plug>(expand_or_nl)" : "\<CR>\<C-R>=AutoPairsReturn()\<CR>")
imap <expr> <Plug>(expand_or_nl) (cm#completed_is_snippet() ? "\<C-U>":"\<CR>")

" Cycle with Tab and Shift + Tab
inoremap <silent><expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
inoremap <silent><expr><s-tab> pumvisible() ? "\<c-p>" : "\<s-tab>"

" Custom completion menu colors
hi Pmenu    ctermfg=231 ctermbg=235
hi PmenuSel ctermfg=232 ctermbg=110
