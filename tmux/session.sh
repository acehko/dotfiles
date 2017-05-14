#!/usr/bin/env bash


# Save or restore tmux environment
if [[ $1 == "save" ]]; then
	source $HOME/.tmux/plugins/tmux-resurrect/scripts/save.sh "quiet"
elif [[ $1 == "restore" ]]; then
	source $HOME/.tmux/plugins/tmux-resurrect/scripts/restore.sh
else
	echo "Invalid command!"
fi
