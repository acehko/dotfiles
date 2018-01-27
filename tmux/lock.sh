#!/usr/bin/env bash
# shellcheck disable=SC1090

# Save tmux environment
source "$HOME/.tmux/plugins/tmux-resurrect/scripts/save.sh" "quiet"

# Show asciiquarium only if not over ssh
if [[ ! -n $SSH_CONNECTION ]]; then
    asciiquarium
    clear
fi
