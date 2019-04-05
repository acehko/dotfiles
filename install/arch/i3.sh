#!/usr/bin/env bash
# shellcheck disable=SC1090
set -e

source "$(dirname "$0")/helpers.sh"

echo "Installing i3..."
PACMAN \
    i3-gaps

AUR \
    i3lock-color

LINK "$DOTFILES/i3" "$XDG_CONFIG_HOME/i3" "config"
