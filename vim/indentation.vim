" Indentation config

" Use spaces instead of tabs
set expandtab
" Auto indent
set autoindent
set smartindent

" Show tab guides
set list
set listchars=tab:\ "

" Function called for four-space indent files
function! FourSpaceIndent()
    set tabstop=4
    set softtabstop=4
    set shiftwidth=4

    silent! IndentLinesEnable
    silent! IndentGuidesDisable
endfunction

" Function called for two-space indent files
function! TwoSpaceIndent()
    set tabstop=2
    set softtabstop=2
    set shiftwidth=2

    silent! IndentLinesDisable
    silent! IndentGuidesEnable
endfunction

" Called when indent guides should be disabled, e.g. vim help
function! NoIndentGuides()
    silent! IndentLinesDisable
    silent! IndentGuidesDisable
endfunction

" Four-space indentation is default
call FourSpaceIndent()

" Call the proper indentation functions for specific file types
augroup IndentationGroup
    autocmd!
    autocmd FileType yaml,toml,javascript call TwoSpaceIndent()
    autocmd FileType help,nerdtree        call NoIndentGuides()
augroup end
