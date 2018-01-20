" vim-go config

let g:go_auto_type_info      = 0           " Don't run GoInfo automatically
let g:go_fmt_autosave        = 0           " Disable gofmt
let g:go_highlight_methods   = 1           " Highlight methods
let g:go_highlight_operators = 1           " Highlight operators
let g:go_addtags_transform   = 'camelcase' " Use camelcase for :GoAddTags

" Bind rename to F2
augroup GoRenameGroup
    autocmd!
    autocmd FileType go nmap <buffer> <F2> <Plug>(go-rename)
augroup end