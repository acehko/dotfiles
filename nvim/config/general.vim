" General config

set encoding=utf8  " UTF-8 FTW
set autoread       " Detect when a file has changed
set visualbell     " No beep on errors
set ttimeoutlen=50 " Remove delay on ESC
set exrc           " Allow per-project configuration files
set secure         " Don't load other people's per-project configs
set ignorecase     " Case-insensitive search
set smartcase      " Use smart case
set incsearch      " Incremental search
set number         " Line numbers
set relativenumber " Relative line numbers
set wrap           " Word wrap
set showcmd        " Show current commands in the footer
set cursorline     " Highlight cursor line
set wildmenu       " Show tab options menu
set lazyredraw     " Redraw only when needed
set mouse=a        " Allow using the mouse
set updatetime=50  " Faster update time

let g:mapleader=','  " map <Leader> to ','

syntax enable      " Enable syntax highlighting

" Always show the sign column
augroup SignColumn
    autocmd!
    autocmd BufRead,BufNewFile * setlocal signcolumn=yes
augroup end

" Clear last message when switching buffer
augroup ClearMessage
    autocmd!
    autocmd BufEnter * echo ''
augroup END

map <F10> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
\ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
\ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

" Clear search
nnoremap <silent> & :echohl Error<CR>:echo "NO!"<CR>:echohl None<CR>
nnoremap <silent> <C-Space> :noh<CR>
nnoremap <silent> * :let b:v=winsaveview()<CR>*:call winrestview(b:v)<CR>

" Scroll offset
set scrolloff=3

" Silence message when opening a file
set shortmess+=F

" Move visible lines instead of rows
nnoremap j gj
nnoremap k gk

" Move rows
nnoremap gj j
nnoremap gk k

" Yank to clipboard
nnoremap YY "+Y
vnoremap Y "+y

let s:last_match = ''
let s:last_match_pos = -1

function! Asdf(words)
    let l:words = substitute(a:words, '\\,', '$$$$$', 'g')
    let l:words = substitute(l:words, '\\:', '#####', 'g')

    let l:lnum = line('.')
    let l:cnum = col('.')

    let l:mlnum = -1
    let l:mcnum = -1

    let l:matches = split(l:words, ',')
    for m in l:matches
        let l:groups = split(m, ':')
        let l:groups_count = len(l:groups)
        if l:groups_count < 2
            continue
        endif

        let l:start = l:groups[0]
        let l:end = l:groups[-1]
        let l:middle = ''

        if l:groups_count > 2
            let l:middle = l:groups[1]
        endif

        let l:start = substitute(l:start, '$$$$$', '\\,', 'g')
        let l:middle = substitute(l:middle, '$$$$$', '\\,', 'g')
        let l:end = substitute(l:end, '$$$$$', '\\,', 'g')

        let l:start = substitute(l:start, '#####', '\\:', 'g')
        let l:middle = substitute(l:middle, '#####', '\\:', 'g')
        let l:end = substitute(l:end, '#####', '\\:', 'g')

        let [l:ml, l:mc] = searchpairpos(l:start, l:middle, l:end, 'rbnW')

        if l:ml <= l:lnum && (l:mlnum == -1 || (l:lnum - l:ml) < (l:lnum - l:mlnum))
            let l:mlnum = l:ml
        endif
    endfor

    if l:mlnum > 0
        " if l:mlnum != s:last_match_pos
            if s:last_match
                call matchdelete(s:last_match)
            endif
            let s:last_match = matchaddpos('MatchParenMatched', [[l:mlnum, 1]], 10)
        " endif
    endif
endfunction

" augroup AsdfGroup
"     autocmd!
"     autocmd CursorMoved * call Asdf(b:match_words)
" augroup END
