# General config

setopt nobeep       # Disable beep on errors
setopt autocd       # Writing a directory name will cd into it
setopt extendedglob # Enables extra file matchig patterns
setopt multios      # Allows redirecting output to multiple files
setopt correct      # Prompt misspelled command correction

# Enable completion
autoload -Uz compinit
compinit
