" Matchup config

" Dont' start on empty buffers
let g:matchup_delim_start_plaintext = 0

" Always highlight
let g:matchup_matchparen_hi_surround_always = 1

" Delay highlighting
let g:matchup_matchparen_deferred = 1
let g:matchup_matchparen_deferred_show_delay = 30
let g:matchup_matchparen_deferred_hide_delay = 50

" Enable ds% and cs%
let g:matchup_surround_enabled = 1

" Don't show offscreen matches in statusline
let g:matchup_matchparen_status_offscreen = 0

" Always operate line-wise
let g:matchup_text_obj_linewise_operators = ['c', 'd', 'v', 'y']

" Number of lines to search in each direction while highlighting
let g:matchup_matchparen_stopline = 100

" Disable highlighting in visual mode
let g:matchup_matchparen_nomode = 'vV\<c-v>'

let g:matchup_matchpref = {
    \ 'html': { 'tagnameonly': 1, },
    \ 'javascript':  { 'tagnameonly': 1, },
\}

let g:matchup_allowed_chars = [40, 41, 123, 125, 91, 93, 60, 62]

let g:matchup_insert_mode = 0

function! MatchupInsert(insert_mode)
    let g:matchup_insert_mode = a:insert_mode
    call MatchupUpdateColors()
endfunction

function! MatchupUpdateColors()
    if g:matchup_insert_mode
        hi! link MatchParen MatchParenDefault
        return
    endif
endfunction

    " Get current line and positions of surrounding block
    " let l:cl = line('.')
    " for l:tries in range(5)
    "     let [l:open, l:close] = matchup#delim#get_surrounding('delim_all',
    "                 \ l:tries ? v:count1 : 1)
    " endfor
    "
    " if !empty(l:open) && !empty(l:close)
    "     if l:open.lnum == l:cl || l:close.lnum == l:cl
    "         hi! link MatchWord MatchWordCurrentLine
    "     else
    "         hi! link MatchWord MatchWordDefault
    "     endif
    " else
    "     echo 'empty'
    " endif
    "
    " if !empty(l:open) && l:open.lnum == l:cl
    "     hi! link MatchWord MatchWordCurrentLine
    " else
    "     hi! link MatchWord MatchWordDefault
    " endif

    " let char = char2nr(matchstr(getline('.'), '\%' . col('.') . 'c.'))
    " if index(g:matchup_allowed_chars, char) != -1
    "     hi! link MatchParen MatchParenMatched
    " else
    "     hi! link MatchParen MatchParenDefault
    " endif
    "
    " if &filetype ==# 'html'
    "     hi! link MatchWordCur MatchWordDefault
    " else
    "     hi! link MatchWordCur MatchWordMatched
    " endif
" endfunction

" augroup UpdateMatchupColorsGroup
"     autocmd!
"     autocmd BufEnter    * call MatchupUpdateColors()
"     autocmd CursorMoved * call MatchupUpdateColors()
"     autocmd InsertEnter * call MatchupInsert(1)
"     autocmd InsertLeave * call MatchupInsert(0)
" augroup END
