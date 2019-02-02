" Ale config
scriptencoding utf-8

" Custom colors
hi ALEError       ctermfg=1 ctermbg=NONE
hi ALEErrorSign   ctermfg=1 ctermbg=NONE
hi ALEWarning     ctermfg=11 ctermbg=NONE
hi ALEWarningSign ctermfg=11 ctermbg=NONE

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
\   'go': ['go build', 'gofmt', 'golint'],
\   'javascript': ['eslint'],
\   'markdown': ['remark-lint'],
\   'typescript': ['eslint', 'tsserver', 'typecheck'],
\}

" Indent with spaces
let g:ale_sh_shfmt_options = '-i 4'

" Enabled fixers
let g:ale_fixers = {
\   'bzl': ['buildifier'],
\   'go': ['goimports'],
\   'javascript': ['eslint'],
\   'python': ['autopep8', 'isort'],
\   'sh': ['shfmt'],
\   'typescript': ['eslint'],
\}

" Fix on save
let g:ale_fix_on_save = 1

" Pipenv support
let pipenv = system('pipenv --venv')
if v:shell_error ==# 0
    let g:ale_virtualenv_dir_names = [substitute(pipenv, '\n', '', '')]
endif
