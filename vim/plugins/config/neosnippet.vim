" Neosnippet config

let g:neosnippet#disable_runtime_snippets = { '_' : 1 }
let g:neosnippet#snippets_directory       = $DOTFILES . '/vim/snippets'

" If a snippet is selected in the completion menu, expand it with <cr>
imap <silent><expr><CR> pumvisible() && neosnippet#expandable_or_jumpable() ? deoplete#mappings#close_popup() .
    \ "\<Plug>(neosnippet_jump_or_expand)" : "\<CR>\<Plug>AutoPairsReturn"

" When closing the completion menu with <esc>,
" if a snippet is being expanded don't return to normal mode
imap <silent><expr><esc> pumvisible() && neosnippet#expandable_or_jumpable() ? deoplete#mappings#close_popup() : "\<esc>"
