" Statusline
scriptencoding utf-8

" Colors
hi StatusLine         ctermfg=231 ctermbg=233
hi StatusLineMode     ctermfg=110 ctermbg=233
hi StatusLineFile     ctermfg=59  ctermbg=233
hi StatusLineFileType ctermfg=59  ctermbg=233
hi StatusLineLocked   ctermfg=167 ctermbg=233
hi StatusLinePosition ctermfg=110 ctermbg=233

" Mode titles
let g:modes={
    \ 'n'  : 'NORMAL',
    \ 'v'  : 'VISUAL',
    \ 'V'  : 'V·LINE',
    \ '' : 'V·BLOCK',
    \ 'i'  : 'INSERT',
    \ 't'  : 'TERMINAL'
\}

" Returns the mode text and changes the mode color
function! StatusLineMode()
    let l:mode = mode()
    call StatusLineChangeColor(l:mode)
    if has_key(g:modes, l:mode)
        return '['.g:modes[l:mode].']'
    endif
    return '['.l:mode.']'
endfunction

" Strps whitespace on a string
function! Strip(str)
    return substitute(a:str, '^\s*\(.\{-}\)\s*$', '\1', '')
endfunction

" Returns the current git branch
function! StatusLineBranch()
    if !exists('g:git_branch')
        let l:branch = system("git branch 2> /dev/null | grep '^*' | sed 's/^* //'")
        let g:git_branch = substitute(l:branch, '\n\+$', '', '')
        let g:git_status = system('command git status --porcelain 2> /dev/null | tail -n1')
    endif

    if strlen(g:git_status) > 0
        hi StatusLineBranch ctermfg=215 ctermbg=233
    else
        hi StatusLineBranch ctermfg=107 ctermbg=233
    endif

    if g:git_branch ==# ''
        return ''
    else
        return ''.g:git_branch.' '
    endif
endfunction

" Changes status line mode color
function! StatusLineChangeColor(mode)
    if a:mode ==# 'n'
        hi StatusLineMode ctermfg=110
    elseif a:mode ==# 'i'
        hi StatusLineMode ctermfg=107
    elseif a:mode ==# 'v' || a:mode ==# 'V' || a:mode ==# ''
        hi StatusLineMode ctermfg=167
    elseif a:mode ==# 't'
        hi StatusLineMode ctermfg=215
    else
        hi StatusLineMode ctermfg=110
    endif
endfunction

" Updates file name color if modified
" and returns a lock icon if read only
function! StatusLineFile()
    if &modified
        hi StatusLineFile ctermfg=215
    else
        hi StatusLineFile ctermfg=59
    endif

    if &readonly || !&modifiable
        return '🔒'
    endif
    return ''
endfunction

" Draw the statusline
set noshowmode
set laststatus=2
set statusline=%#StatusLineMode#%{StatusLineMode()}
set statusline+=\ %#StatusLineBranch#%{StatusLineBranch()}
set statusline+=%#StatusLineFileType#»%#StatusLineFile#\ %f\ %#StatusLineLocked#%{StatusLineFile()}
set statusline+=%=%#StatusLineFileType#%{&filetype}\ [%{&fileencoding?&fileencoding:&encoding}]
set statusline+=\ %#StatusLineMode#[%l/%L\ \ %c]
