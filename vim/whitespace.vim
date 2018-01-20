" Whitespace config

" Trim trailing whitespace and empty lines at the end of file
function! TrimWhitespace()

    " Save the current search and cursor position
    let l:search=@/
    let l:line = line('.')
    let l:column = col('.')

    " Delete empty lines at the end of file
    silent! normal! %s#\($\n\s*\)\+\%$##

    " Delete trailing whitespace
    silent! normal! %s/\s\+$//e

    " Restore the saved search and cursor position
    let @/ = l:search
    call cursor(l:line, l:column)

endfunction

" Trim whitespace on save
augroup TrimWhitespaceGroup
    autocmd!
    autocmd BufWritePre * :call TrimWhitespace()
augroup end
