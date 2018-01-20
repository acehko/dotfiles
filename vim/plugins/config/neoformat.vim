" Neoformat

" Enabled formatters
let g:neoformat_enabled_go       = ['goimports']
let g:neoformat_enabled_json     = ['jsbeautify']
let g:neoformat_enabled_typescript = ['jsbeautify']
let g:neoformat_enabled_python   = ['autopep8']
let g:neoformat_enabled_markdown = ['remark']

" Only show messages on error
let g:neoformat_only_msg_on_error = 1

" Format on save
augroup Neoformat
    autocmd!
    autocmd BufWritePre *.html,*.css,*.json,*.py,*md silent! undojoin | Neoformat
augroup end
