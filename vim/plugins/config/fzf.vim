" FZF config

" Close Tagbar, NERDTree and open FZF
function! OpenFZF()
    TagbarClose
    if exists(':NERDTreeClose')
        NERDTreeClose
    endif
    FZF
endfunction

" Bind OpenFZF to CTRL + P
nnoremap <silent> <C-p> :call OpenFZF()<CR>

" Enable fuzzy matching
let g:cm_matcher = {
\   'module': 'cm_matchers.abbrev_matcher',
\   'case': 'smartcase',
\}
