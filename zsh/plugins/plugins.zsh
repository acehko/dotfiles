#!/usr/bin/env zsh

# Plugins
source $HOME/.zsh/antigen/antigen.zsh

antigen bundle hlissner/zsh-autopair
antigen bundle tarrasch/zsh-bd
antigen bundle zuxfoucault/colored-man-pages_mod
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-syntax-highlighting

antigen apply

# Load plugin configs
for config ($DOTFILES/zsh/plugins/conf/*.zsh) . $config
