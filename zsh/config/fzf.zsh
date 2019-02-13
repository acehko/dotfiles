# Fzf config

export FZF_DEFAULT_OPTS=$(echo -n "
    --bind=ctrl-space:toggle
    --height 40%
    --no-reverse
    --multi
    --prompt='❯ '
    --border
    --no-bold
    --color hl:5,fg+:$COLOR_BLUE,bg+:$COLOR_BLACK,hl+:5
    --color info:$COLOR_GREEN,prompt:$COLOR_BLUE,spinner:$COLOR_GREEN,pointer:$COLOR_BLUE,marker:$COLOR_ORANGE,border:$COLOR_BLUE
")

export FZF_DEFAULT_COMMAND='rg --files --smart-case --hidden --follow --glob "!.git/*"'

source $HOME/.fzf/shell/key-bindings.zsh
