" --- Vim-Plug Start ---

call plug#begin('~/.vim/plugged')


" Plugins
Plug 'easymotion/vim-easymotion'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'


call plug#end()

" --- Vim-Plug End ---


" --- Vim Config Start ---

" General
set nocompatible   " Not compatible with Vi
set autoread       " Detect when a file has changed
set visualbell     " No beep on errors
set ttimeoutlen=50 " Remove delay on ESC


" --- Vim Config End ---


" --- Plugin Config Start ---


" EasyMotion
map <Leader> <Plug>(easymotion-prefix)


" --- Plugin Config End ---
