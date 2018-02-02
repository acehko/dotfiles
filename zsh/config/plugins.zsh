#!/usr/bin/env zsh
# Plugins

source $HOME/.zsh/antigen/antigen.zsh

antigen bundles <<EOF
    hlissner/zsh-autopair
    littleq0903/gcloud-zsh-completion
    tarrasch/zsh-bd
    zuxfoucault/colored-man-pages_mod
    zsh-users/zsh-autosuggestions
    zsh-users/zsh-syntax-highlighting
EOF

antigen apply

# Load plugin configs
source $DOTFILES/zsh/config/plugins/autosuggest.zsh
source $DOTFILES/zsh/config/plugins/syntax-highlighting.zsh
