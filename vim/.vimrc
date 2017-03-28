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
Plug 'raimondi/delimitmate'

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


" Tabs and spaces
set tabstop=4
set softtabstop=4
set shiftwidth=4

set autoindent
set smartindent


" Folding
setlocal foldmethod=syntax
set foldlevelstart=20

nnoremap <space> za
vnoremap <space> zf

augroup AutoSaveFolds
  autocmd!
  autocmd BufWinLeave * mkview
  autocmd BufWinEnter * silent loadview
augroup END


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


" Strip trailing whitespace and empty lines at the end of file
function! StripWhitespace()

    " Save the current search and cursor position
    let _s=@/
    let l = line('.')
    let c = col('.')

    " Strip the whitespace
	silent! :%s#\($\n\s*\)\+\%$## " Delete empty lines at the end of file
	silent! :%s/\s\+$//e          " Delete trailing whitespace

    " Restore the saved search and cursor position
    let @/=_s
    call cursor(l, c)

endfunction

" Strip whitespace on save
autocmd BufWritePre * :call StripWhitespace()


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
let g:airline_powerline_fonts             = 1    " Use powerline font
let g:airline_skip_empty_sections         = 1    " Don't display empty sections


" Syntastic
let g:syntastic_check_on_wq				 = 0             " Don't check on close
let g:syntastic_auto_jump				 = 3             " Auto jump to first error but not warning
let g:syntastic_typescript_checkers      = ['tsuquyomi'] " Set TypeScript checker to tsuquyomi


" YouCompleteMe
let g:ycm_show_diagnostics_ui = 0 " Disable error-checking. Handled by syntastic


" Tsuquyomi
let g:tsuquyomi_disable_quickfix = 1 " Disable vim quickfix window, syntastic will handle checks
" Bind TsuquyomiRenameSymbol on F2
autocmd FileType typescript nmap <buffer> <F2> <Plug>(TsuquyomiRenameSymbol)


" DevIcons
let g:webdevicons_enable_airline_statusline            = 1    " Enabled on airline
let g:WebDevIconsNerdTreeAfterGlyphPadding             = ''   " Padding after the icon
let g:WebDevIconsUnicodeDecorateFileNodesDefaultSymbol = ''	  " Default icon for unknown file types
let g:WebDevIconsUnicodeDecorateFolderNodes            = 1    " Enable icons on folders
let g:DevIconsEnableFoldersOpenClose                   = 1    " Enable separate icons for opened/closed folder
let g:DevIconsDefaultFolderOpenSymbol                  = ' ' " Override default icon for opened folder with an extra space


" DelimitMate
let g:delimitMate_expand_cr = 1 " Auto-indent


" --- Plugin Config End ---
