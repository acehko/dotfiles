#!/usr/bin/env zsh

# Dotfiles location
export DOTFILES="$HOME/dotfiles"
export DOTFILES_ZSH="$DOTFILES/zsh"

# Defatul editors
export VISUAL="nvim"
export EDITOR="$VISUAL"

# Gopath
export GOPATH="$HOME/code/go"
export GOPATH_BIN="$GOPATH/bin"

# Ruby
export RUBY_BIN="$(ruby -e 'print Gem.user_dir')/bin"

# Colors
source "$DOTFILES_ZSH/config/colors.zsh"
