" Window config

" Window creation
map <C-w>h :vnew<CR>
map <C-w>j :below new<CR>
map <C-w>k :new<CR>
map <C-w>l :rightb vnew<CR>

" Close a window
map <C-w>x :q<CR>

" Window movement
map <C-h> :wincmd h<CR>
map <C-j> :wincmd j<CR>
map <C-k> :wincmd k<CR>
map <C-l> :wincmd l<CR>

" Tab management
map <C-w>c :tabe<CR>
map <C-w>n :tabn<CR>
map <C-w>p :tabp<CR>

" Switching between most recent buffers
nnoremap <Leader>, :b#<CR>

" Set the currently active window number globally.
" It can be used to check if the current window is the active one.
" For example to show/hide some data in the status line.
let g:win_active_nr = winnr()
augroup ActiveWindowGroup()
    autocmd!
    autocmd BufEnter * let g:win_active_nr = winnr()
augroup end
