" vim-gitgutter config
scriptencoding utf-8

" Custom symbols
let g:gitgutter_sign_added              = '┃'
let g:gitgutter_sign_modified           = '┃'
let g:gitgutter_sign_removed            = '┃'
let g:gitgutter_sign_removed_first_line = '┃'
let g:gitgutter_sign_modified_removed   = '┃'

" Custom colors
hi GitGutterAdd          ctermfg=2 ctermbg=NONE
hi GitGutterChange       ctermfg=11 ctermbg=NONE
hi GitGutterDelete       ctermfg=1 ctermbg=NONE
hi GitGutterChangeDelete ctermfg=11 ctermbg=NONE

" Update gutter on text change
augroup GitGutterTextChangedGroup
    autocmd!
    autocmd TextChanged,TextChangedI * :GitGutter
augroup end
