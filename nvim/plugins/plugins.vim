" Plugins

call plug#begin('~/.vim/plugged')

" General
Plug 'w0rp/ale'
Plug 'airblade/vim-gitgutter'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'Valloric/ListToggle'
Plug 'tmux-plugins/vim-tmux-focus-events'
Plug 'dhruvasagar/vim-zoom'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-fugitive'
Plug 'godlygeek/tabular', { 'on': 'Tabularize' }
Plug 'jiangmiao/auto-pairs'
Plug 'majutsushi/tagbar'
Plug 'sbdchd/neoformat'
Plug 'scrooloose/nerdcommenter'
Plug 'terryma/vim-multiple-cursors'
Plug 'easymotion/vim-easymotion'
Plug 'dominikduda/vim_current_word'
Plug 'haya14busa/incsearch.vim'
Plug 'xolox/vim-misc'
Plug 'xolox/vim-notes', { 'on': 'Note' }
Plug 'ludovicchabant/vim-gutentags'
" Plug 'andymass/vim-matchup'
Plug 'tpope/vim-endwise', { 'for': ['sh', 'ruby', 'vim', 'zsh'] }

" File management
Plug 'scrooloose/nerdtree',                     { 'on': ['NERDTree', 'NERDTreeToggle', 'NERDTreeFind'] }
Plug 'robinfehr/nerdtree-git-plugin',           { 'on': ['NERDTree', 'NERDTreeToggle', 'NERDTreeFind'] }
Plug 'tiagofumo/vim-nerdtree-syntax-highlight', { 'on': ['NERDTree', 'NERDTreeToggle', 'NERDTreeFind'] }
Plug 'ryanoasis/vim-devicons',                  { 'on': ['NERDTree', 'NERDTreeToggle', 'NERDTreeFind'] }

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all --no-update-rc' }
Plug 'junegunn/fzf.vim'

" Filetype support
Plug 'bazelbuild/vim-ft-bzl'
Plug 'cespare/vim-toml'
Plug 'elzr/vim-json', { 'for': 'json' }
Plug 'martinda/Jenkinsfile-vim-syntax'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'shime/vim-livedown', { 'for': 'markdown' }

" Look and feel
Plug 'Yggdroot/indentline'

" HTML
Plug 'mattn/emmet-vim',    { 'for': 'html' }
Plug 'alvan/vim-closetag', { 'for': 'html' }

" JavaScript
Plug 'pangloss/vim-javascript', { 'for': 'javascript' }

" TypeScript
Plug 'leafgarland/typescript-vim',   { 'for': 'typescript' }
Plug 'HerringtonDarkholme/yats.vim', { 'for': 'typescript' }
Plug 'mhartington/nvim-typescript',  { 'for': 'typescript', 'do': './install.sh' }
Plug 'Quramy/tsuquyomi',             { 'for': 'typescript' }
Plug 'Shougo/vimproc.vim',           { 'for': 'typescript', 'do': 'make' }

" Coffeescript"
Plug 'kchmck/vim-coffee-script', { 'for': 'coffee' }
Plug 'lukaszkorecki/CoffeeTags', { 'for': 'coffee' }

" Go
Plug 'fatih/vim-go',      { 'for': 'go', 'do': ':GoInstallBinaries' }
Plug 'zchee/deoplete-go', { 'for': 'go', 'do': 'make'}

" Python
Plug 'davidhalter/jedi-vim', { 'for': 'python' }
Plug 'zchee/deoplete-jedi',  { 'for': 'python' }

" Vim
Plug 'Shougo/neco-vim', { 'for': 'vim' }

" Ruby
Plug 'tpope/vim-rails', { 'for': 'ruby' }

call plug#end()
