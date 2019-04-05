" Deoplete config

" Hide preview window
set completeopt-=preview

" Hide quiet messages about auto completion
set shortmess+=c
" set completeopt+=noinsert

let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_camel_case = 1

call deoplete#custom#source('_', 'matchers', ['matcher_fuzzy'])

call deoplete#custom#source('go', 'rank', 9999)
call deoplete#custom#source('vim', 'rank', 9999)
call deoplete#custom#source('ruby', 'rank', 9999)

call deoplete#custom#option('auth_refresh_delay', 0)

let g:deoplete#auto_complete_delay = 0

" If completion menu is visible use tag to cycle through it otherwise expand snippet
imap <silent><expr><tab>   pumvisible() ? "\<c-n>" : "\<tab>"
imap <silent><expr><s-tab> pumvisible() ? "\<c-p>" : "\<s-tab>"
