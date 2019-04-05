" Tagbar config

" Toggle on CTRL + G
nnoremap <silent> <C-G> :call ToggleTagbar()<CR>
function! ToggleTagbar()
    if &filetype ==# 'tagbar'
        TagbarClose
    else
        TagbarOpenAutoClose
    endif
endfunction

" Jump between tags with CTRL + J and CTRL + K
let g:tagbar_map_nexttag    = '<C-j>'
let g:tagbar_map_prevtag    = '<C-k>'
let g:tagbar_map_togglefold = '<Space>'

" Custom fold characters
let g:tagbar_iconchars = ['', '']
