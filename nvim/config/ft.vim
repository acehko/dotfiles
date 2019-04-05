" Custom filetypes

augroup CustomFileTypesGroup
    autocmd!
    autocmd BufRead,BufNewFile .yamllint,.hadolint set filetype=yaml
    autocmd BufRead,BufNewFile .eslintrc,.remarkrc set filetype=json
    autocmd BufRead,BufNewFile *.axlsx,*.jbuilder  set filetype=ruby
    autocmd BufRead,BufNewFile *.js.coffee.erb     set filetype=coffee
augroup end
