" Plugins

call plug#begin('~/.vim/plugged')

" General
Plug 'acehko/ale'
Plug 'airblade/vim-gitgutter'
Plug 'andrewradev/splitjoin.vim'

" File management
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'robinfehr/nerdtree-git-plugin', { 'on': 'NERDTreeToggle' }
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'

" Filetype support
Plug 'bazelbuild/vim-ft-bzl'
Plug 'cespare/vim-toml'
Plug 'martinda/Jenkinsfile-vim-syntax'

Plug 'elzr/vim-json', { 'for': 'json' }
Plug 'godlygeek/tabular'
Plug 'jiangmiao/auto-pairs'
Plug 'nanotech/jellybeans.vim'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'majutsushi/tagbar'
Plug 'sbdchd/neoformat'
Plug 'scrooloose/nerdcommenter'
Plug 'shime/vim-livedown', { 'for': 'markdown' }
Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'xolox/vim-misc'
Plug 'xolox/vim-notes', { 'do': 'mkdir -p $HOME/.vim/notes' }
Plug 'yggdroot/indentline'
Plug 'sirver/ultisnips'
Plug 'roxma/nvim-completion-manager'
Plug 'easymotion/vim-easymotion'
Plug 'dominikduda/vim_current_word'
Plug 'haya14busa/incsearch.vim'

" JavaScript
Plug 'pangloss/vim-javascript', { 'for': 'javascript' }

" TypeScript
Plug 'leafgarland/typescript-vim',  { 'for': 'typescript' }
Plug 'mhartington/nvim-typescript', { 'for': 'typescript' }
Plug 'quramy/tsuquyomi',            { 'for': 'typescript' }
Plug 'shougo/vimproc.vim',          { 'for': 'typescript', 'do': 'make' }

" Go
Plug 'fatih/vim-go', { 'for': 'go', 'do': ':GoInstallBinaries' }

" Vim
Plug 'shougo/neco-vim'

call plug#end()
