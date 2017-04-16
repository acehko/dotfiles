# --- Antigen Start ---
source $ZSH_PATH/antigen/antigen.zsh


antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-syntax-highlighting

antigen apply
# --- Antigen End ---



# --- Plugin Config Start ---



# Autosuggest
bindkey '^ '   autosuggest-accept  # Bind CTRL + Space to accept the curretn suggestion
bindkey '^[^M' autosuggest-execute # Bind ALT  + Enter to execute the current suggestion


# Syntax Highlighting
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets)

# Main
ZSH_HIGHLIGHT_STYLES[unknown-token]=fg=red
ZSH_HIGHLIGHT_STYLES[precommand]=fg=none
ZSH_HIGHLIGHT_STYLES[commandseparator]=fg=yellow
ZSH_HIGHLIGHT_STYLES[path]=none
ZSH_HIGHLIGHT_STYLES[globbing]=none
ZSH_HIGHLIGHT_STYLES[back-quoted-argument]=fg=green
ZSH_HIGHLIGHT_STYLES[single-quoted-argument]=fg=green
ZSH_HIGHLIGHT_STYLES[double-quoted-argument]=fg=green
ZSH_HIGHLIGHT_STYLES[dollar-double-quoted-argument]=fg=none
ZSH_HIGHLIGHT_STYLES[back-double-quoted-argument]=fg=none
ZSH_HIGHLIGHT_STYLES[redirection]=fg=yellow
ZSH_HIGHLIGHT_STYLES[arg0]=fg=blue

# Brackets
ZSH_HIGHLIGHT_STYLES[bracket-error]=fg=red
ZSH_HIGHLIGHT_STYLES[bracket-level-1]=fg=blue
ZSH_HIGHLIGHT_STYLES[bracket-level-2]=fg=blue
ZSH_HIGHLIGHT_STYLES[bracket-level-3]=fg=blue
ZSH_HIGHLIGHT_STYLES[bracket-level-4]=fg=blue
ZSH_HIGHLIGHT_STYLES[bracket-level-5]=fg=blue



# --- Plugin Config End ---