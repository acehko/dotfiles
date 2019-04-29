#!/usr/bin/env bash
# shellcheck disable=SC1090
set -e

source "$(dirname "$0")/helpers.sh"

echo "Installing neofetch..."
AUR \
    neofetch

echo
echo "Linking neofetch config..."
LINK "$DOTFILES/neofetch" "$XDG_CONFIG_HOME/neofetch" "config"
