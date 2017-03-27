" --- Vim-Plug Start ---

call plug#begin('~/.vim/plugged')


" Plugins

" General
Plug 'easymotion/vim-easymotion'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'flazz/vim-colorschemes'

" NERDTree
Plug 'scrooloose/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'


call plug#end()

" --- Vim-Plug End ---


" --- Vim Config Start ---

" General
set nocompatible   " Not compatible with Vi
set autoread       " Detect when a file has changed
set visualbell     " No beep on errors
set ttimeoutlen=50 " Remove delay on ESC


" UI
syntax enable  " Enable syntax highlighting
colorscheme jellybeans

set number         " Line numbers
set relativenumber " Relative line numbers
set wrap           " Word wrap
set showcmd        " Show current commands in the footer
set cursorline     " Highlight cursor line
set wildmenu       " Show tab options menu
set lazyredraw     " Redraw only when needed
set mouse=a        " Allow using the mouse


" Window management

" Window creation
map <C-w>h :vnew<CR>
map <C-w>j :below new<CR>
map <C-w>k :new<CR>
map <C-w>l :rightb vnew<CR>

map <C-w>x :q<CR> " Close a window

" Window movement
map <C-h> :wincmd h<CR>
map <C-j> :wincmd j<CR>
map <C-k> :wincmd k<CR>
map <C-l> :wincmd l<CR>

" Tab management
map <C-w>c :tabe<CR>
map <C-w>n :tabn<CR>
map <C-w>p :tabp<CR>


" --- Vim Config End ---


" --- Plugin Config Start ---


" EasyMotion
map <Leader> <Plug>(easymotion-prefix)

" NERDTree
map <C-b> :NERDTreeTabsToggle<CR>
let g:nerdtree_tabs_open_on_console_startup = 2         " Open NERDTree if a directory was opened
let NERDTreeMapActivateNode                 = '<Space>' " Open / close directorties and files with space
let g:NERDTreeQuitOnOpen                    = 1         " Close NERDTree when opening a file
let NERDTreeShowHidden                      = 1         " Show hidden files by default


" --- Plugin Config End ---
