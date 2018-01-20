" Ale config
scriptencoding utf-8

" Automatically open loclist
let g:ale_open_list = 1

" Custom colors
hi ALEError       ctermfg=160 ctermbg=NONE
hi ALEErrorSign   ctermfg=160 ctermbg=NONE
hi ALEWarning     ctermfg=215 ctermbg=NONE
hi ALEWarningSign ctermfg=215 ctermbg=NONE

" Custom symbols
let g:ale_sign_error   = '✘'
let g:ale_sign_warning = ''

" Enabed linters
let g:ale_linters = {
\   'javascript': ['eslint'],
\   'go': ['go build', 'gofmt', 'golint', 'go vet', 'staticcheck'],
\}

" Enabled fixers
let g:ale_fixers = {
\   'bzl': ['buildifier'],
\   'javascript': ['eslint'],
\   'go': ['goimports']
\}

" Fix on save
let g:ale_fix_on_save = 1
