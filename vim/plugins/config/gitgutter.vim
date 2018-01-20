" vim-gitgutter config

" Custom symbols
let g:gitgutter_sign_added              = '┃'
let g:gitgutter_sign_modified           = '┃'
let g:gitgutter_sign_removed            = '┃'
let g:gitgutter_sign_removed_first_line = '┃'
let g:gitgutter_sign_modified_removed   = '┃'

" Custom colors
hi GitGutterAdd          ctermfg=107 ctermbg=NONE
hi GitGutterChange       ctermfg=215 ctermbg=NONE
hi GitGutterDelete       ctermfg=167 ctermbg=NONE
hi GitGutterChangeDelete ctermfg=215 ctermbg=NONE
