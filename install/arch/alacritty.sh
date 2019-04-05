#!/usr/bin/env bash
# shellcheck disable=SC1090
set -e

source "$(dirname "$0")/helpers.sh"

echo "Installing alacritty..."
PACMAN \
    alacritty

echo
echo "Linking alacritty config..."
LINK "$DOTFILES_ALACRITTY" "$XDG_CONFIG_HOME/alacritty" "alacritty.yml"
