#!/usr/bin/env bash
# shellcheck disable=SC1090
set -e

source "$(dirname "$0")/helpers.sh"

echo "Installing i3..."
PACMAN \
    feh \
    i3-gaps \
    light \
    unclutter

AUR \
    i3lock-color

echo
echo "Linking i3 config..."
LINK "$DOTFILES/i3" "$XDG_CONFIG_HOME/i3" "config"
