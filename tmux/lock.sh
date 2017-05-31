#!/usr/bin/env bash


# Save tmux environment
source $HOME/.tmux/plugins/tmux-resurrect/scripts/save.sh "quiet"

# Show asciiquarium only if not over ssh
if [[ ! -n $SSH_CONNECTION ]]; then
	asciiquarium
fi
