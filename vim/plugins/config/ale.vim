" Ale config
scriptencoding utf-8

" Custom colors
hi ALEError       ctermfg=167 ctermbg=NONE
hi ALEErrorSign   ctermfg=167 ctermbg=NONE
hi ALEWarning     ctermfg=215 ctermbg=NONE
hi ALEWarningSign ctermfg=215 ctermbg=NONE

" Decrease delay
let g:ale_lint_delay = 50

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

" Close quickfix after selecting
augroup QuickFixCloseGroup
    autocmd!
    autocmd FileType qf nmap <buffer> <cr> <cr>:ccl<cr>
augroup end


" Enabed linters
let g:ale_linters = {
\   'go': ['go build', 'gofmt', 'golint', 'go vet'],
\   'javascript': ['eslint'],
\   'markdown': ['remark-lint'],
\}

" Indent with spaces
let g:ale_sh_shfmt_options = '-i 4'

" Enabled fixers
let g:ale_fixers = {
\   'bzl': ['buildifier'],
\   'go': ['goimports'],
\   'javascript': ['eslint'],
\   'sh': ['shfmt'],
\}

" Fix on save
let g:ale_fix_on_save = 1
