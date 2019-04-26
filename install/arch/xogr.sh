#!/usr/bin/env bash
# shellcheck disable=SC1090
set -e

source "$(dirname "$0")/helpers.sh"

echo "Installing xorg..."
PACMAN \
    xdg-user-dirs \
    xorg-apps \
    xorg-server \
    xorg-xclock \
    xorg-xinit \
    xterm

echo "Creating user dirs..."
xdg-user-dirs-update

echo
echo "Linking xorg config..."
LINK "$DOTFILES/xorg" "$HOME" ".xinitrc" ".Xresources"
