#!/usr/bin/env zsh

# Fzf config

export FZF_DEFAULT_OPTS=$(echo -n "
    --bind=ctrl-space:toggle
    --height 40%
    --no-reverse
    --multi
    --prompt='❯ '
    --border
    --no-bold
    --color hl:$COLOR_TERM_MAGENTA,fg+:$COLOR_TERM_BLUE,bg+:$COLOR_TERM_BLACK,hl+:$COLOR_TERM_MAGENTA
    --color info:$COLOR_TERM_GREEN,prompt:$COLOR_TERM_BLUE,spinner:$COLOR_TERM_GREEN,pointer:$COLOR_TERM_BLUE,marker:$COLOR_TERM_YELLOW,border:$COLOR_TERM_BLUE
")

export FZF_DEFAULT_COMMAND='rg --files --smart-case --hidden --follow --glob "!.git/*"'

source $HOME/.fzf/shell/key-bindings.zsh
