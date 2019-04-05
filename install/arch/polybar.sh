#!/usr/bin/env bash
# shellcheck disable=SC1090
set -e

source "$(dirname "$0")/helpers.sh"

echo "Installing polybar..."
AUR polybar

echo
echo "Linking polybar config..."
LINK "$DOTFILES/polybar" "$XDG_CONFIG_HOME/polybar" "config"
