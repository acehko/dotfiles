export DOTFILES=$HOME/dotfiles
export ZSH_PATH=$DOTFILES/zsh

for config ($ZSH_PATH/**/*.zsh) source $config
