" Deoplete config

let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_camel_case = 1

call deoplete#custom#source('_', 'matchers', ['matcher_full_fuzzy'])

call deoplete#custom#set('go', 'rank', 9999)
call deoplete#custom#set('vim', 'rank', 9999)
