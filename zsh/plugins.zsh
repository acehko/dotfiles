# --- Antigen Start ---
source $HOME/.zsh/antigen/antigen.zsh


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
ZSH_HIGHLIGHT_STYLES[unknown-token]=fg=167                 # Red
ZSH_HIGHLIGHT_STYLES[reserved-word]=fg=215                 # Yellow
ZSH_HIGHLIGHT_STYLES[precommand]=fg=none
ZSH_HIGHLIGHT_STYLES[commandseparator]=fg=215              # Yellow
ZSH_HIGHLIGHT_STYLES[path]=none
ZSH_HIGHLIGHT_STYLES[globbing]=none
ZSH_HIGHLIGHT_STYLES[back-quoted-argument]=fg=107          # Green
ZSH_HIGHLIGHT_STYLES[single-quoted-argument]=fg=107        # Green
ZSH_HIGHLIGHT_STYLES[double-quoted-argument]=fg=107        # Green
ZSH_HIGHLIGHT_STYLES[dollar-double-quoted-argument]=fg=231 # White
ZSH_HIGHLIGHT_STYLES[back-double-quoted-argument]=fg=231   #W hite
ZSH_HIGHLIGHT_STYLES[redirection]=fg=215                   # Yellow
ZSH_HIGHLIGHT_STYLES[arg0]=fg=110                          # Blue

# Brackets
ZSH_HIGHLIGHT_STYLES[bracket-error]=fg=167                 # Red
ZSH_HIGHLIGHT_STYLES[bracket-level-1]=fg=110               # Blue
ZSH_HIGHLIGHT_STYLES[bracket-level-2]=fg=110               # Blue
ZSH_HIGHLIGHT_STYLES[bracket-level-3]=fg=110               # Blue
ZSH_HIGHLIGHT_STYLES[bracket-level-4]=fg=110               # Blue
ZSH_HIGHLIGHT_STYLES[bracket-level-5]=fg=110               # Blue

# --- Plugin Config End ---
