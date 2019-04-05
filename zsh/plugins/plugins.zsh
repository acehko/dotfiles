#!/usr/bin/env zsh

# Load anitgen
source $HOME/.zsh/antigen/antigen.zsh

# Plugins
antigen bundles <<EOF
    hlissner/zsh-autopair
    littleq0903/gcloud-zsh-completion
    tarrasch/zsh-bd
    zuxfoucault/colored-man-pages_mod
    zsh-users/zsh-autosuggestions
    zsh-users/zsh-syntax-highlighting
EOF

# Install plugins
antigen apply

# Load plugin config
source "$DOTFILES_ZSH/plugins/config/config.zsh"
