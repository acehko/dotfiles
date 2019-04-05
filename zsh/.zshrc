#!/usr/bin/env zsh

# Load config
source $DOTFILES/zsh/config/config.zsh

# Run neofetch if not running in tmux
if [[ -z $TMUX ]]; then
    neofetch
fi
