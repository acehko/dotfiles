" Folding config

set foldlevelstart=20
set viewoptions-=options

" Fold/unfold with <space>
nnoremap <space> za

" Persist folds between restarts
augroup FoldingGroup
    autocmd!
    autocmd FileType    * setlocal foldmethod=syntax
    autocmd BufWinLeave * silent! mkview
    autocmd BufWinEnter * silent! loadview
augroup end
" --- Folds End ---
