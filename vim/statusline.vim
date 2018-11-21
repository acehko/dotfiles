" Statusline
scriptencoding utf-8

set noshowmode   " Hide the default mode shower
set laststatus=2 " Enable the statusline

" Colors
hi StatusLine               ctermfg=59  ctermbg=NONE
hi StatusLineNC             ctermfg=59  ctermbg=NONE
hi StatusLineMode           ctermfg=110 ctermbg=NONE
hi StatusLineFilePrefix     ctermfg=59  ctermbg=NONE
hi StatusLineFile           ctermfg=59  ctermbg=NONE
hi StatusLineFileType       ctermfg=59  ctermbg=NONE
hi StatusLineLocked         ctermfg=167 ctermbg=NONE
hi StatusLineFileStatus     ctermfg=107 ctermbg=NONE
hi StatusLinePosition       ctermfg=110 ctermbg=NONE
hi StatusLineErrors         ctermfg=167 ctermbg=NONE
hi StatusLineWarnings       ctermfg=215 ctermbg=NONE
hi StatusLineCursorPosition ctermfg=110 ctermbg=NONE

" Mode titles
let g:mode_titles = {
    \ 'c'  : 'COMMAND',
    \ 'n'  : 'NORMAL',
    \ 'v'  : 'VISUAL',
    \ 'V'  : 'V·LINE',
    \ '' : 'V·BLOCK',
    \ 'i'  : 'INSERT',
    \ 't'  : 'TERMINAL',
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
        return '['.g:mode_titles[l:mode].']'
    endif

    " The mode title is not set, return the original mode title
    return '['.l:mode.']'
endfunction

" Changes status line mode color.
function! StatusLineChangeColor(mode)
    if a:mode ==# 'c'
        hi StatusLineMode ctermfg=215
    elseif a:mode ==# 'n'
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

" Returns the current git branch and changes the color if clean/dirty.
function! StatusLineBranch()
	" If the current window is not the active one
	" or not a git repo, don't show the branch
	if g:win_active_nr != winnr() || !g:is_git_repo
		return ''
	endif

	" Change color based on the git status
    if g:git_dirty
        hi StatusLineBranch ctermfg=215 ctermbg=233
    else
        hi StatusLineBranch ctermfg=107 ctermbg=233
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
			hi StatusLineFile ctermfg=215
		else
			hi StatusLineFile ctermfg=59
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
        if b:git_file_status ==# 'Added'
            hi StatusLineFileStatus ctermfg=107
        elseif b:git_file_status ==# 'Modified'
            hi StatusLineFileStatus ctermfg=215
        else
            hi StatusLineFileStatus ctermfg=167
        endif

        return GitFileStatusIndicator(b:git_file_status) . ' '
    endif
    return ''
endfunction

" Returns ALE Erorrs if there are any
function! StatusLineErrors()
    let l:ale_status = ale#statusline#Count(bufnr('%'))
    let l:errors = l:ale_status['error'] + l:ale_status['style_error']

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
        hi StatusLineCursorPosition ctermfg=110
    else
        hi StatusLineCursorPosition ctermfg=59
    endif
    return ''
endfunction

" Draws the statusline, called only once per window
" and only for buffers that are modifiable.
function! DrawStatusLine()
    if &modifiable && !exists('b:statusline')
        let b:statusline=1
        setlocal statusline=%#StatusLineMode#%{StatusLineMode()}
        setlocal statusline+=\ %#StatusLineBranch#%{StatusLineBranch()}
        setlocal statusline+=%#StatusLineFilePrefix#%{StatusLineFilePrefix()}
        setlocal statusline+=%#StatusLineFile#%f\ %#StatusLineLocked#%{StatusLineFileSuffix()}
        setlocal statusline+=%#StatusLineFileStatus#%{StatusLineGitFileIndicator()}
        setlocal statusline+=%=
        setlocal statusline+=%#StatusLineErrors#%{StatusLineErrors()}
        setlocal statusline+=%#StatusLineWarnings#%{StatusLineWarnings()}
        setlocal statusline+=%#StatusLineFileType#%{&filetype}\ [%{&fileencoding?&fileencoding:&encoding}]
        setlocal statusline+=\ %#StatusLineCursorPosition#%{StatusLineChangeCursorPositionColor()}[%l/%L\ :\ %c]
    endif
endfunction

" Draw the statusline when entering a buffer.
augroup DrawStatusLineGroup
    autocmd!
    autocmd BufEnter,BufRead * call DrawStatusLine()
augroup end
