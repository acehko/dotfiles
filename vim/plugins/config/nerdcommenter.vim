" NERDCommenter config
"
let g:NERDSpaceDelims       = 1 " Add space after comment delimiters
let g:NERDCommentEmptyLines = 1 " Comment empty lines

" Align left instead of following code indentation
let g:NERDDefaultAlign = 'left'

" Bind to CTRL + /
map <C-_> <Plug>NERDCommenterInvert
