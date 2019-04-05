" Statusline
scriptencoding utf-8

set noshowmode   " Hide the default mode shower
set laststatus=2 " Enable the statusline

" Mode titles
let g:mode_titles = {
    \ 'c'  : 'COMMAND',
    \ 'n'  : 'NORMAL',
    \ 'v'  : 'VISUAL',
    \ 'V'  : 'V·LINE',
    \ '' : 'V·BLOCK',
    \ 'i'  : 'INSERT',
    \ 't'  : 'TERMINAl',
    \ 's'  : 'SNIPPET',
\}

" Returns the mode title and changes the mode color.
function! StatusLineMode()
    " If the current window is not the active one
    " don't display the vim mode
    if g:win_active_nr != winnr()
        return ''
    endif

    " Get the current mode and change the color
    let l:mode = mode()
    call StatusLineChangeColor(l:mode)

    " If the mode title exists return it
    if has_key(g:mode_titles, l:mode)
        return g:mode_titles[l:mode] . ' '
    endif

    " The mode title is not set, return the original mode title
    return l:mode . ' '
endfunction

" Changes status line mode color.
function! StatusLineChangeColor(mode)
    if a:mode ==# 'c'
        hi! link StatusLineMode StatusLineCommandMode
    elseif a:mode ==# 'n'
        hi! link StatusLineMode StatusLineNormalMode
    elseif a:mode ==# 'i'
        hi! link StatusLineMode StatusLineInsertMode
    elseif a:mode ==# 'v' || a:mode ==# 'V' || a:mode ==# ''
        hi! link StatusLineMode StatusLineVisualMode
    elseif a:mode ==# 't'
        hi! link StatusLineMode StatusLineTerminalMode
    else
        hi! link StatusLineMode StatusLineNormalMode
    endif
endfunction

" Returns the current git branch and changes the color if clean/dirty.
function! StatusLineBranch()
    " If the current window is not the active one
    " or not a git repo, don't show the branch
    if g:win_active_nr != winnr() || !g:is_git_repo
        return ''
    endif

    " Change color based on the git status
    if g:git_dirty
        hi! link StatusLineBranch StatusLineBranchDirty
    else
        hi! link StatusLineBranch StatusLineBranchClean
    endif

    " Return git branch name
    return '' . g:git_branch . ' '
endfunction

" Returns the '»' character if the current window is active
" and change the color if the file has been modified.
function! StatusLineFilePrefix()
    if g:win_active_nr == winnr()
        " Change color
        if &modified
            hi! link StatusLineFile StatusLineFileUnsaved
        else
            hi! link StatusLineFile StatusLineFileSaved
        endif

        return '» '
    endif

    return ''
endfunction

" Returns the '🔒' character if the file is read-only.
function! StatusLineFileSuffix()
    if &readonly
        return '🔒'
    endif

    return ''
endfunction

" Returns the git status indicator and update the indicator color
function! StatusLineGitFileIndicator()
    if exists('b:git_file_status') && len(b:git_file_status)
        if g:win_active_nr != winnr()
            hi! link StatusLineFileStatus StatusLineInactive
        elseif b:git_file_status ==# 'Added'
            hi! link StatusLineFileStatus StatusLineFileStatusAdded
        elseif b:git_file_status ==# 'Modified'
            hi! link StatusLineFileStatus StatusLineFileStatusModified
        else
            hi! link StatusLineFileStatus StatusLineFileStatusRemoved
        endif

        return GitFileStatusIndicator(b:git_file_status) . ' '
    endif
    return ''
endfunction

" Returns ALE Erorrs if there are any
function! StatusLineErrors()
    let l:ale_status = ale#statusline#Count(bufnr('%'))
    let l:errors = l:ale_status['error'] + l:ale_status['style_error']

    if g:win_active_nr != winnr()
        hi! link StatusLineErrors StatusLineInactive
        hi! link StatusLineWarnings StatusLineInactive
    else
        hi! link StatusLineErrors ErrorMsg
        hi! link StatusLineWarnings WarningMsg
    endif

    if l:errors
        return '✘/' . l:errors . ' '
    endif

    return ''
endfunction

" Returns ALE Warnings if there are any
function! StatusLineWarnings()
    let l:ale_status = ale#statusline#Count(bufnr('%'))
    let l:warnings = l:ale_status['info'] + l:ale_status['warning'] + l:ale_status['style_warning']

    if l:warnings
        return '/' . l:warnings . ' '
    endif

    return ''
endfunction

" Updates the statusline cursor position color
function! StatusLineChangeCursorPositionColor()
    if g:win_active_nr == winnr()
        hi! link StatusLineCursorPosition StatusLineCursorPositionActive
    else
        hi! link StatusLineCursorPosition StatusLineCursorPositionInactive
    endif
    return ''
endfunction

" Draws the statusline, called only once per window
" and only for buffers that are modifiable.
function! DrawStatusLine()
    if &modifiable && !exists('b:statusline')
        let b:statusline=1
        setlocal statusline=%#StatusLineMode#%{StatusLineMode()}
        setlocal statusline+=%#StatusLineBranch#%{StatusLineBranch()}
        setlocal statusline+=%#StatusLineFilePrefix#%{StatusLineFilePrefix()}
        setlocal statusline+=%#StatusLineFile#%f\ %#StatusLineFileLocked#%{StatusLineFileSuffix()}
        setlocal statusline+=%#StatusLineFileStatus#%{StatusLineGitFileIndicator()}
        setlocal statusline+=%=
        setlocal statusline+=%#StatusLineErrors#%{StatusLineErrors()}
        setlocal statusline+=%#StatusLineWarnings#%{StatusLineWarnings()}
        setlocal statusline+=%#StatusLineFileType#%{&filetype}\ %{&fileencoding?&fileencoding:&encoding}
        setlocal statusline+=\ %#StatusLineCursorPosition#%{StatusLineChangeCursorPositionColor()}%c\ %L
    endif
endfunction
call DrawStatusLine()

" Draw the statusline when entering a buffer.
augroup DrawStatusLineGroup
    autocmd!
    autocmd BufEnter,BufRead * call DrawStatusLine()
augroup end
