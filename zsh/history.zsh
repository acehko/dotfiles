# History config

HISTFILE=~/.zsh_history     # History file
HISTSIZE=10000              # Number of history lines to read at the start of a new session
SAVEHIST=10000              # Number of history lines to save at the end of a session

setopt   hist_verify        # Don't immediately execute a command when using history expansion
setopt   append_history     # Append history instead of overwriting it
setopt   inc_append_history # Save each command to history immediately, not when the shell exits
unsetopt share_history      # Don't share history between multiple running instances
setopt   extended_history   # Save time when a command was started and how long it ran for
setopt   hist_ignore_dups   # Don't save duplicate lines
