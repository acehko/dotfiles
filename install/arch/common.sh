#!/usr/bin/env bash
# shellcheck disable=SC1090
set -e

source "$(dirname "$0")/helpers.sh"

echo -e "\\nInstalling common packages..."

PACMAN \
    curl \
    htop \
    xclip

AUR \
    nerd-fonts-complete-mono-glyphs
