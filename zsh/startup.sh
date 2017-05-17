#!/usr/bin/env bash

# If not running in tmux, display neofetch
if [[ ! -n $TMUX ]]; then
	clear && neofetch
fi
