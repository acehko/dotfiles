# General config

setopt nobeep              # Disable beep on errors
setopt autocd              # Writing a directory name will cd into it
setopt extendedglob        # Enables extra file matchig patterns
setopt multios             # Allows redirecting output to multiple files
setopt correct             # Prompt misspelled command correction
setopt interactivecomments # Allow comments in the shell


# Enable completion
autoload -Uz compinit && compinit

# Enable completion menu selection
zstyle ':completion:*' menu select

# Bind SHIFT + TAB for previous selection
bindkey '^[[Z' reverse-menu-complete
