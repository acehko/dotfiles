#!/usr/bin/env bash


# Save tmux environment
source $DOTFILES/tmux/session.sh save

# Show asciiquarium only if not over ssh
if [[ ! -n $SSH_CONNECTION ]]; then
	asciiquarium
fi
