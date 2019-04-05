" Tsuquyomi config

" Disable quickfix window, Ale will handle checks
let g:tsuquyomi_disable_quickfix = 1

" Bind TsuquyomiRenameSymbol to F2
augroup TypescriptRenameGroup
    autocmd!
    autocmd FileType typescript nmap <buffer> <F2> <Plug>(TsuquyomiRenameSymbol)
augroup end
