" Indentation config
scriptencoding utf-8

" Use spaces instead of tabs
set expandtab

" Auto indent
set autoindent
set smartindent

" Show tab guides
set list
set listchars=tab:\ "

" Default settings
set tabstop=4
set softtabstop=4
set shiftwidth=4
silent! IndentLinesEnable

" Function called for four-space indent files
function! FourSpaceIndent()
    setlocal tabstop=4
    setlocal softtabstop=4
    setlocal shiftwidth=4

    silent! IndentLinesEnable
    silent! IndentGuidesDisable
endfunction

" Function called for two-space indent files
function! TwoSpaceIndent()
    setlocal tabstop=2
    setlocal softtabstop=2
    setlocal shiftwidth=2

    silent! IndentLinesDisable
    silent! IndentGuidesEnable
endfunction

" Called when indent guides should be disabled, e.g. vim help
function! NoIndentGuides()
    silent! IndentLinesDisable
    silent! IndentGuidesDisable
endfunction

let g:indent_two_spaces = [
\   'yaml',
\   'toml',
\   'javascript',
\   'json',
\]

let g:indent_none = [
\   'help',
\   'nerdtree',
\]

function! Indent()
    if &filetype ==# '' || index(g:indent_none, &filetype) > -1
        call NoIndentGuides()
    elseif index(g:indent_two_spaces, &filetype) > -1
        call TwoSpaceIndent()
    else
        call FourSpaceIndent()
    endif
endfunction

" Call the proper indentation functions for specific file types
augroup IndentationGroup
    autocmd!
    autocmd BufEnter * call Indent()
augroup end
