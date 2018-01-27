" Window config

" Window creation
nnoremap <C-w>h :vnew<CR>
nnoremap <C-w>j :below new<CR>
nnoremap <C-w>k :new<CR>
nnoremap <C-w>l :rightb vnew<CR>

" Close a window
nnoremap <C-w>x :q<CR>

" Window movement
nnoremap <C-h> :wincmd h<CR>
nnoremap <C-j> :wincmd j<CR>
nnoremap <C-k> :wincmd k<CR>
nnoremap <C-l> :wincmd l<CR>

" Tab management
nnoremap <C-w>c :tabe<CR>
nnoremap <C-w>n :tabn<CR>
nnoremap <C-w>p :tabp<CR>

" Switching between most recent buffers
nnoremap <Leader>, :b#<CR>

" Set the currently active window number globally.
" It can be used to check if the current window is the active one.
" For example to show/hide some data in the status line.
let g:win_active_nr = winnr()
augroup ActiveWindowGroup()
    autocmd!
    autocmd WinEnter * let g:win_active_nr = winnr()
augroup end
