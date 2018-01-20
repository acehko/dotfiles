" Whitespace config

" Trim trailing whitespace and empty lines at the end of file
function! TrimWhitespace()

    " Save the current search and cursor position
    let _s=@/
    let l = line('.')
    let c = col('.')

    silent! %s#\($\n\s*\)\+\%$## " Delete empty lines at the end of file
    silent! %s/\s\+$//e          " Delete trailing whitespace

    " Restore the saved search and cursor position
    let @/=_s
    call cursor(l, c)

endfunction

" Trim whitespace on save
augroup TrimWhitespaceGroup
    autocmd!
    autocmd BufWritePre * :call TrimWhitespace()
augroup end
