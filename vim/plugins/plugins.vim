" Plugins

call plug#begin('~/.vim/plugged')

" General
Plug 'acehko/ale'
Plug 'airblade/vim-gitgutter'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'Valloric/ListToggle'

" File management
Plug 'scrooloose/nerdtree',                     { 'on': 'NERDTreeToggle' }
Plug 'robinfehr/nerdtree-git-plugin',           { 'on': 'NERDTreeToggle' }
Plug 'tiagofumo/vim-nerdtree-syntax-highlight', { 'on': 'NERDTreeToggle' }
Plug 'ryanoasis/vim-devicons',                  { 'on': 'NERDTreeToggle' }

Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'

" Filetype support
Plug 'bazelbuild/vim-ft-bzl'
Plug 'cespare/vim-toml'
Plug 'martinda/Jenkinsfile-vim-syntax'

" Completion
Plug 'Shougo/deoplete.nvim'
Plug 'roxma/nvim-yarp'
Plug 'roxma/vim-hug-neovim-rpc'

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
Plug 'Yggdroot/indentline'
Plug 'SirVer/ultisnips'
Plug 'easymotion/vim-easymotion'
Plug 'dominikduda/vim_current_word'
Plug 'haya14busa/incsearch.vim'

" JavaScript
Plug 'pangloss/vim-javascript', { 'for': 'javascript' }

" TypeScript
Plug 'leafgarland/typescript-vim',  { 'for': 'typescript' }
Plug 'mhartington/nvim-typescript', { 'for': 'typescript' }
Plug 'Quramy/tsuquyomi',            { 'for': 'typescript' }
Plug 'Shougo/vimproc.vim',          { 'for': 'typescript', 'do': 'make' }

" Go
Plug 'fatih/vim-go',      { 'for': 'go', 'do': ':GoInstallBinaries' }
Plug 'zchee/deoplete-go', { 'for': 'go', 'do': 'make'}

" Vim
Plug 'Shougo/neco-vim', { 'for': 'vim' }

call plug#end()
