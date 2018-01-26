" Custom filetypes

augroup CustomFileTypesGroup
    autocmd!
    autocmd BufRead,BufNewFile .yamllint,.hadolint set filetype=yaml
    autocmd BufRead,BufNewFile .eslintrc,.remarkrc set filetype=json
augroup end
