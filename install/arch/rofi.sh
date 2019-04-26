#!/usr/bin/env bash
# shellcheck disable=SC1090
set -e

source "$(dirname "$0")/helpers.sh"

echo "Installing rofi..."
PACMAN \
    rofi

echo
echo "Linking rofi config..."
LINK "$DOTFILES/rofi" "$XDG_CONFIG_HOME/rofi" "config"
