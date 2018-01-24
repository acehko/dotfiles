" Deoplete config

let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_camel_case = 1

call deoplete#custom#source('_', 'matchers', ['matcher_full_fuzzy'])

call deoplete#custom#set('go', 'rank', 9999)
call deoplete#custom#set('vim', 'rank', 9999)

" If completion menu is visible use tag to cycle through it otherwise expand snippet
imap <silent><expr><tab>   pumvisible() ? "\<c-n>" : (neosnippet#expandable_or_jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<tab>")
imap <silent><expr><s-tab> pumvisible() ? "\<c-p>" : "\<s-tab>"

" Custom completion menu colors
hi Pmenu    ctermfg=231 ctermbg=235
hi PmenuSel ctermfg=232 ctermbg=110
