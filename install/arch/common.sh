#!/usr/bin/env bash
# shellcheck disable=SC1090
set -e

source "$(dirname "$0")/helpers.sh"

echo "Installing common packages..."

PACMAN \
    curl \
    htop \
    light \
    xclip \
    unclutter

AUR \
    nerd-fonts-complete-mono-glyphs