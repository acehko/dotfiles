" vim-gitgutter config
scriptencoding utf-8

" Custom symbols
let g:gitgutter_sign_added              = '┃'
let g:gitgutter_sign_modified           = '┃'
let g:gitgutter_sign_removed            = '┃'
let g:gitgutter_sign_removed_first_line = '┃'
let g:gitgutter_sign_modified_removed   = '┃'

" Update gutter on text change
augroup GitGutterTextChangedGroup
    autocmd!
    autocmd TextChanged,TextChangedI * :GitGutter
augroup end
