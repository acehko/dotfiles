" NERDTree config
scriptencoding utf-8

let g:NERDTreeMapActivateNode     = '<Space>' " Open / close directorties and files with space
let g:NERDTreeQuitOnOpen          = 1         " Close NERDTree when opening a file
let g:NERDTreeDirArrowExpandable  = ''       " Custom collapsed icon
let g:NERDTreeDirArrowCollapsible = ''       " Custom expanded icon
let g:NERDTreeMinimalUI           = 1         " Hide help text

" Custom directory color
hi NERDTreeDir ctermfg=6
highlight! link NERDTreeFlags NERDTreeDir

" Bind NERDTree to CTRL + B
noremap <silent> <C-b> :NERDTreeToggle<CR>

" Bind NERDTreeFind to CTRL + F
noremap <silent> <C-f> :NERDTreeFind<CR>

" Open NERDTree when a directory is opened or no files are specified
function! OpenNERDTree(argc, argv)
    if a:argc == 0 && !exists('s:std_in')
        NERDTree
    elseif a:argc == 1 && isdirectory(a:argv[0]) && !exists('s:std_in')
        execute 'NERDTree' a:argv[0]
        wincmd p
        ene
        NERDTreeFocus
    endif
endfunction

augroup OpenNERDTreeGroup
    autocmd!
    autocmd StdinReadPre * let s:std_in=1
    autocmd VimEnter * call OpenNERDTree(argc(), argv())
augroup end

" Close vim if the only window open is NERDTree
augroup CloseNERDTreeGroup
    autocmd!
    autocmd BufEnter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
augroup end
