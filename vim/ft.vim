" Custom filetypes

augroup CustomFileTypesGroup
    autocmd!
    autocmd BufRead,BufNewFile .yamllint,.hadolint set filetype=yaml
    autocmd BufRead,BufNewFile .eslintrc,.remarkrc set filetype=json
    autocmd BufRead,BufNewFile *.axlsx             set filetype=ruby
augroup end
