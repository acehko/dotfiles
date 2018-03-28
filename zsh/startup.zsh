#!/usr/bin/env zsh

# Not running in tmux
if [[ -z $TMUX ]]; then
    neofetch
fi
