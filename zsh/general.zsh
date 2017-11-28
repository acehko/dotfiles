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

# Use arrow keys to search history matching the current buffer
autoload -U history-search-end

zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end

bindkey '\e[A' history-beginning-search-backward-end
bindkey '\e[B' history-beginning-search-forward-end

# Fix some common keys
bindkey "\e[1~" beginning-of-line
bindkey "\e[4~" end-of-line
bindkey "\e[5~" beginning-of-history
bindkey "\e[6~" end-of-history
bindkey "\e[3~" delete-char
bindkey "\e[2~" quoted-insert
bindkey "\e[5C" forward-word
bindkey "\eOc"  emacs-forward-word
bindkey "\e[5D" backward-word
bindkey "\eOd"  emacs-backward-word
bindkey "\ee[C" forward-word
bindkey "\ee[D" backward-word
bindkey "\^H"   backward-delete-word
