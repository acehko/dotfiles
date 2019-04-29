#!/usr/bin/env bash
# shellcheck disable=SC1090
set -e

source "$(dirname "$0")/helpers.sh"

echo "Installing xorg..."
PACMAN \
    xdg-user-dirs \
    xdg-settings \
    xorg-apps \
    xorg-server \
    xorg-xclock \
    xorg-xinit \
    xterm

echo "Creating user dirs..."
xdg-user-dirs-update

echo
echo "Linking xorg config..."
LINK "$DOTFILES/xorg" "$HOME" ".xinitrc" ".XCompose" ".Xresources"
sudo bash -c "$(declare -f LINK); LINK '$DOTFILES/xorg' '/etc/X11/xorg.conf.d' '30-touchpad.conf'"
