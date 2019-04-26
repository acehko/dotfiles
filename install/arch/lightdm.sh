#!/usr/bin/env bash
# shellcheck disable=SC1090
set -e

source "$(dirname "$0")/helpers.sh"

echo "Installing lightdm..."
PACMAN \
    lightdm

AUR \
    lightdm-slick-greeter

sudo systemctl enable lightdm

echo
echo "Linking lightdm config..."
sudo bash -c "$(declare -f LINK); LINK '$DOTFILES/lightdm' '/etc/lightdm' 'lightdm.conf' 'slick-greeter.conf'"
