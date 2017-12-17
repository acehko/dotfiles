#!/usr/bin/env zsh

# Enable completion
autoload -Uz compinit && compinit

# Enable completion menu selection
zstyle ':completion:*' menu select

# Bind SHIFT + TAB for previous selection
bindkey '^[[Z' reverse-menu-complete
