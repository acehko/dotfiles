# General config

setopt nobeep       # Disable beep on errors
setopt autocd       # Writing a directory name will cd into it
setopt extendedglob # Enables extra file matchig patterns
setopt multios      # Allows redirecting output to multiple files
setopt correct      # Prompt misspelled command correction

# Fix HOME and END keys
bindkey '\e[1~' beginning-of-line
bindkey '\e[4~' end-of-line

bindkey -v # Use vi as the line editor
