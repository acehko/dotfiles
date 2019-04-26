#!/usr/bin/env bash
# shellcheck disable=SC1090
set -e

source "$(dirname "$0")/helpers.sh"

echo "Installing compton..."
AUR \
    compton-tryone-git

echo
echo "Linking compton config..."
sudo bash -c "$(declare -f LINK); LINK '$DOTFILES/compton' 'etc/xdg' 'compton.conf'"
