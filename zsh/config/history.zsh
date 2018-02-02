#!/usr/bin/env zsh
# History config

HISTFILE=~/.zsh_history # History file
HISTSIZE=10000          # Number of history lines to read at the start of a new session
SAVEHIST=10000          # Number of history lines to save at the end of a session

setopt   append_history     # Append history instead of overwriting it
setopt   inc_append_history # Save each command to history immediately, not when the shell exits
unsetopt share_history      # Don't share history between multiple running instances
setopt   extended_history   # Save timestamps
setopt   hist_ignore_dups   # Don't save duplicate lines

# Use arrow keys to search history matching the current buffer
autoload -U history-search-end

zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end

bindkey '\e[A' history-beginning-search-backward-end
bindkey '\e[B' history-beginning-search-forward-end
