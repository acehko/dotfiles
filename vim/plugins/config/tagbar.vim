" Tagbar config

" Toggle on CTRL + G
nnoremap <C-G> :TagbarClose<CR> \| :TagbarOpenAutoClose<CR>

" Jump between tags with CTRL + J and CTRL + K
let g:tagbar_map_nexttag    = '<C-j>'
let g:tagbar_map_prevtag    = '<C-k>'
let g:tagbar_map_togglefold = '<Space>'
