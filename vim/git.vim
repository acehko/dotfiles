" Set the current git branch and status globally.

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
    let g:git_branch = systemlist('git branch 2> /dev/null | grep "^*" | sed "s/^* //"')[0]

    " Check if there are uncommited changes
    let g:git_dirty = systemlist('command git status --porcelain 2> /dev/null | tail -n1 | wc -l')[0]
endfunction

" Update the git info on every buffer switch and focus gained.
augroup GitInfoGroup()
    autocmd!
    autocmd BufEnter,FocusGained * call SetGitInfo()
augroup end
