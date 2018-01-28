# Fzf config

export FZF_DEFAULT_OPTS='
    --bind=ctrl-space:toggle
    --height 40%
    --no-reverse
    --multi
    --prompt="❯ "
    --border
    --no-bold
    --color fg:188,bg:233,hl:183,fg+:110,bg+:233,hl+:183
    --color info:107,prompt:110,spinner:107,pointer:110,marker:215
'

export FZF_DEFAULT_COMMAND='rg --files --smart-case --hidden --follow --glob "!.git/*"'

source $HOME/.fzf.zsh
