" Window config

" Window creation
nnoremap <silent> <C-w>h :vnew<CR>
nnoremap <silent> <C-w>j :below new<CR>
nnoremap <silent> <C-w>k :new<CR>
nnoremap <silent> <C-w>l :rightb vnew<CR>

" Close a window
nnoremap <silent> <C-w>x :q<CR>

" Window movement
nnoremap <silent> <C-h> :wincmd h<CR>
nnoremap <silent> <C-j> :wincmd j<CR>
nnoremap <silent> <C-k> :wincmd k<CR>
nnoremap <silent> <C-l> :wincmd l<CR>

" Tab management
nnoremap <silent> <C-w>c :tabe<CR>
nnoremap <silent> <C-w>n :tabn<CR>
nnoremap <silent> <C-w>p :tabp<CR>

" Switching between most recent buffers
nnoremap <silent> <Leader>, :b#<CR>

" Set the currently active window number globally.
" It can be used to check if the current window is the active one.
" For example to show/hide some data in the status line.
let g:win_active_nr = winnr()
augroup ActiveWindowGroup()
    autocmd!
    autocmd WinEnter * let g:win_active_nr = winnr()
augroup end
