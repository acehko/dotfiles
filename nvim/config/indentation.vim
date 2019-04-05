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

:vnoremap < <gv
:vnoremap > >gv

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
    silent! IndentLinesReset
endfunction

" Function called for two-space indent files
function! TwoSpaceIndent()
    setlocal tabstop=2
    setlocal softtabstop=2
    setlocal shiftwidth=2
    silent! IndentLinesReset
endfunction

let g:indent_two_spaces = [
\   'eruby',
\   'eruby.yaml',
\   'javascript',
\   'json',
\   'ruby',
\   'toml',
\   'typescript',
\   'yaml',
\   'coffee'
\]

let g:no_indent_lines = [
\   'help',
\   'nerdtree',
\   'tagbar',
\]

function! Indent()
    if index(g:indent_two_spaces, &filetype) > -1
        call TwoSpaceIndent()
    else
        call FourSpaceIndent()
    endif
endfunction

function! IndentLines()
    if &filetype ==# '' || index(g:no_indent_lines, &filetype) > -1
        silent! IndentLinesDisable
    else
        silent! IndentLinesEnable
    endif
endfunction

" Call the proper indentation functions for specific file types
augroup IndentationGroup
    autocmd!
    autocmd BufEnter * call Indent()
    autocmd BufEnter * call IndentLines()
augroup end
