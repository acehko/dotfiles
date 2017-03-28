" --- Vim-Plug Start ---

call plug#begin('~/.vim/plugged')


" Plugins

" General
Plug 'easymotion/vim-easymotion'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'flazz/vim-colorschemes'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'vim-syntastic/syntastic'
Plug 'Valloric/YouCompleteMe', { 'do' : './install.py' }

" Airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" NERDTree
Plug 'scrooloose/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'ryanoasis/vim-devicons'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'


" TypeScript
Plug 'Shougo/vimproc.vim',         { 'for' : 'typescript', 'do' : 'make' }
Plug 'Quramy/tsuquyomi',           { 'for' : 'typescript' }
Plug 'leafgarland/typescript-vim', { 'for' : 'typescript' }


call plug#end()

" --- Vim-Plug End ---



" --- Vim Config Start ---

" General
set encoding=utf8  " UTF-8 FTW
set nocompatible   " Not compatible with Vi
set autoread       " Detect when a file has changed
set visualbell     " No beep on errors
set ttimeoutlen=50 " Remove delay on ESC


" UI
syntax enable      " Enable syntax highlighting
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


" CtrlP
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard'] " Ignore files in .gitignore
" Disable default keybind and rebind to close NERDTree and then open CtrlP
let g:ctrlp_map = '<Nop>'
map <C-p> :NERDTreeClose \| :CtrlP<CR>


" Airline
set laststatus=2                                 " Always show the status line
let g:airline#extensions#tabline#enabled  = 1    " Always show all buffers
let g:airline#extensions#tabline#fnamemod = ':t' " Show only filename in buffers

let g:airline_section_error   = '' " Remove error section
let g:airline_section_warning = '' " Remove warning section

let g:airline_powerline_fonts = 1


" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list            = 1
let g:syntastic_check_on_wq 		 = 0             " Don't check on close
let g:syntastic_auto_jump 		 = 3             " Jump to first error but not warning
let g:syntastic_typescript_checkers      = ['tsuquyomi'] " Set TypeScript checker to tsuquyomi


" Tsuquyomi
let g:tsuquyomi_disable_quickfix = 1 " Disable vim quickfix window, syntastic will handle checks


" DevIcons
let g:webdevicons_enable_airline_statusline            = 1
let g:WebDevIconsNerdTreeAfterGlyphPadding             = ''
let g:WebDevIconsUnicodeDecorateFileNodesDefaultSymbol = ''
let g:WebDevIconsUnicodeDecorateFolderNodes            = 1
let g:DevIconsEnableFoldersOpenClose                   = 1
let g:DevIconsDefaultFolderOpenSymbol                  = ' '


" --- Plugin Config End ---
