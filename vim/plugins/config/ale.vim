" Ale config
scriptencoding utf-8

" Custom colors
hi ALEError       ctermfg=160 ctermbg=NONE
hi ALEErrorSign   ctermfg=160 ctermbg=NONE
hi ALEWarning     ctermfg=215 ctermbg=NONE
hi ALEWarningSign ctermfg=215 ctermbg=NONE

" Custom symbols
let g:ale_sign_error   = '✘'
let g:ale_sign_warning = ''

" Jump between errors
nmap ]e <Plug>(ale_next_wrap)
nmap [e <Plug>(ale_previous_wrap)

" Show linter name in error message
let g:ale_echo_msg_format = '%linter%: %code: %%s'

" Use quickfix instead of loclist
let g:ale_set_loclist = 0
let g:ale_set_quickfix = 1

" Enabed linters
let g:ale_linters = {
\   'javascript': ['eslint'],
\   'go': ['go build', 'gofmt', 'golint', 'go vet'],
\}

" Enabled fixers
let g:ale_fixers = {
\   'bzl': ['buildifier'],
\   'javascript': ['eslint'],
\   'go': ['goimports']
\}

" Fix on save
let g:ale_fix_on_save = 1
