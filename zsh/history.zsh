#!/usr/bin/env zsh

# History config

# History file
HISTFILE=~/.zsh_history
# Number of history lines to read at the start of a new session
HISTSIZE=10000
# Number of history lines to save at the end of a session
SAVEHIST=10000

# Append history instead of overwriting it
setopt   append_history
# Save each command to history immediately, not when the shell exits
setopt   inc_append_history
# Don't share history between multiple running instances
unsetopt share_history
# Save timestamps
setopt   extended_history
# Don't save duplicate lines
setopt   hist_ignore_dups

# Use arrow keys to search history matching the current buffer
autoload -U history-search-end

zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end

bindkey '\e[A' history-beginning-search-backward-end
bindkey '\e[B' history-beginning-search-forward-end
