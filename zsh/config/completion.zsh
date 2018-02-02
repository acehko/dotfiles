#!/usr/bin/env zsh

fpath=(~/.zsh/completions $fpath)

# Enable completion
autoload -Uz compinit && compinit

# Enable completion menu selection
zstyle ':completion:*' menu select

# Bind SHIFT + TAB for previous selection
bindkey '^[[Z' reverse-menu-complete

# Use cache
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.zsh/cache
