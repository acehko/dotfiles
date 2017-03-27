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

" UI
syntax enable  " Enable syntax highlighting

set number         " Line numbers
set relativenumber " Relative line numbers
set wrap           " Word wrap
set showcmd        " Show current commands in the footer
set cursorline     " Highlight cursor line
set wildmenu       " Show tab options menu
set lazyredraw     " Redraw only when needed
set mouse=a        " Allow using the mouse

" --- Vim Config End ---


" --- Plugin Config Start ---


" EasyMotion
map <Leader> <Plug>(easymotion-prefix)


" --- Plugin Config End ---
