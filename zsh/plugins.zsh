# --- Antigen Start ---
source $ZSH_PATH/antigen/antigen.zsh

antigen bundle zsh-users/zsh-autosuggestions

antigen apply
# --- Antigen End ---



# --- Plugin Config Start ---


# Autosuggest
bindkey '^ '   autosuggest-accept  # Bind CTRL + Space to accept the curretn suggestion
bindkey '^[^M' autosuggest-execute # Bind ALT  + Enter to execute the current suggestion


# --- Plugin Config End ---
