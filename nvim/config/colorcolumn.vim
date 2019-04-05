let g:colorcolumn_settings = {
\   'coffee': 81,
\   'python': 81,
\}

function! SetColorColumn()
    exec 'set colorcolumn=' . get(g:colorcolumn_settings, &filetype, 0)
endfunction

augroup ColorColumnGroup
    autocmd!
    autocmd BufEnter * call SetColorColumn()
augroup end
