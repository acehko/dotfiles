" Deoplete config

" Hide preview window
set completeopt-=preview

" Hide quiet messages about auto completion
set shortmess+=c

let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_camel_case = 1

call deoplete#custom#source('_', 'matchers', ['matcher_full_fuzzy'])

call deoplete#custom#source('go', 'rank', 9999)
call deoplete#custom#source('vim', 'rank', 9999)

" If completion menu is visible use tag to cycle through it otherwise expand snippet
imap <silent><expr><tab>   pumvisible() ? "\<c-n>" : "\<tab>"
imap <silent><expr><s-tab> pumvisible() ? "\<c-p>" : "\<s-tab>"

" Custom completion menu colors
hi Pmenu    ctermfg=231 ctermbg=235
hi PmenuSel ctermfg=232 ctermbg=110
