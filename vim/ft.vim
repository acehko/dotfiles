" Custom filetypes

augroup CustomFileTypesGroup
    autocmd!
    autocmd BufRead,BufNewFile .yamllint,.hadolint setfiletype=yaml
augroup end
