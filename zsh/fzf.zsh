# Fzf config

# Custom options
export FZF_DEFAULT_OPTS='
    --bind=ctrl-space:toggle
    --height 40%
    --no-reverse
    --border
    --no-bold
    --color fg:188,bg:233,hl:215,fg+:110,bg+:233,hl+:215
    --color info:107,prompt:110,spinner:107,pointer:110,marker:215
'

# Default search command
export FZF_DEFAULT_COMMAND='rg --files --smart-case --hidden --follow --glob "!.git/*"'

source ~/.fzf.zsh
