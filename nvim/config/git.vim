" Set the current git branch and status globally.
scriptencoding utf8

let g:is_git_repo = 0  " 1 if the current directory is a git repo
let g:git_branch  = '' " Current git branch name
let g:git_dirty   = 0  " 1 if there are uncommited changes in the repo

" Updates the git info.
function! SetGitInfo()
    " Check if the directory is a git repo
    if !g:is_git_repo
        let g:is_git_repo = systemlist('git rev-parse --git-dir > /dev/null 2>&1 && echo "1" || echo "0"')[0]
    endif

    " Not a git repo, return
    if !g:is_git_repo
        return
    endif

    " Get branch name
    let g:git_branch = fugitive#head()

    " Check if there are uncommited changes
    let g:git_dirty = systemlist('git status --porcelain 2> /dev/null | tail -n1 | wc -l')[0]
endfunction

" Update the git info on every buffer switch and focus gained.
augroup GitInfoGroup
    autocmd!
    autocmd BufEnter,BufWritePost,FocusGained * call SetGitInfo()
augroup end

" Updates the git file status.
function! SetGitFileStatus()
    let b:git_file_status = ''

    if !g:is_git_repo || !g:git_dirty
        return
    endif

    let l:git_status = systemlist('git -c color.status=false status -s ' . @%)
    if !len(l:git_status)
        return
    endif

    let l:git_status = l:git_status[0]
    let l:git_status = l:git_status[0] . l:git_status[1]
    if l:git_status ==# '??'
        let b:git_file_status = 'Added'
    elseif l:git_status[0] ==#  'M' || l:git_status[1] ==# 'M'
        let b:git_file_status = 'Modified'
	else
        let b:git_file_status = 'Unknown'
    endif
endfunction

" Update the git file status on read, write and focus gained.
augroup GitFileStatusGroup
    autocmd!
    autocmd BufReadPost,BufWritePost,FocusGained * call SetGitFileStatus()
augroup end

let s:git_status_indicators = {
\   'Added': '',
\   'Modified' : '',
\   'Unknown' : ''
\}

" Returns the git file status indicator.
function! GitFileStatusIndicator(status)
    if has_key(s:git_status_indicators, a:status)
        return s:git_status_indicators[a:status]
    endif
    return ''
endfunction
