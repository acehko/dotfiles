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
