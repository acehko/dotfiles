" Indentation config
scriptencoding utf-8

" Use spaces instead of tabs
set expandtab

" Auto indent
set autoindent
set smartindent

" Show tab guides
set list
set listchars=tab:\ ,trail:·"

let g:indentLine_color_term = 8

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
endfunction

" Function called for two-space indent files
function! TwoSpaceIndent()
    setlocal tabstop=2
    setlocal softtabstop=2
    setlocal shiftwidth=2
endfunction

let g:indent_two_spaces = [
\   'javascript',
\   'json',
\   'ruby',
\   'toml',
\   'typescript',
\   'yaml',
\]

let g:indent_guides = [
\   'toml',
\   'yaml',
\   'ruby',
\]

let g:no_indent_guides = [
\   'help',
\   'nerdtree',
\   'javascript',
\   'json',
\   'typescript',
\]

function! Indent()
    if index(g:indent_two_spaces, &filetype) > -1
        call TwoSpaceIndent()
    else
        call FourSpaceIndent()
    endif
endfunction

function! IndentGuides()
    if &filetype ==# '' || index(g:no_indent_guides, &filetype) > -1
        silent! IndentLinesDisable
        silent! IndentGuidesDisable
    elseif index(g:indent_guides, &filetype) > -1
        silent! IndentLinesDisable
        silent! IndentGuidesEnable
    else
        silent! IndentLinesEnable
        silent! IndentGuidesDisable
    endif
endfunction

" Call the proper indentation functions for specific file types
augroup IndentationGroup
    autocmd!
    autocmd BufEnter * call Indent()
    autocmd BufEnter * call IndentGuides()
augroup end
