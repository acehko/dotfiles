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
silent! colorscheme jellybeans

" Always show the sign column
augroup SignColumn
    autocmd!
    autocmd BufRead,BufNewFile * setlocal signcolumn=yes
augroup end

" Sign column color
hi SignColumn ctermbg=233

" WildMenu colors
hi WildMenu ctermfg=110 ctermbg=NONE

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
