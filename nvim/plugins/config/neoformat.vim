" Neoformat

" Enabled formatters
let g:neoformat_enabled_go         = ['goimports']
let g:neoformat_enabled_json       = ['jq']
let g:neoformat_enabled_typescript = ['jsbeautify']
let g:neoformat_enabled_markdown   = ['remark']

" Only show messages on error
let g:neoformat_only_msg_on_error = 1

" Format on save
augroup Neoformat
    autocmd!
    autocmd BufWritePre *.html,*.css,*.json,*.md silent! undojoin | Neoformat
augroup end
