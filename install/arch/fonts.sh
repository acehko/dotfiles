#!/usr/bin/env bash
# shellcheck disable=SC1090
set -e

source "$(dirname "$0")/helpers.sh"

echo "Installing fonts..."

PACMAN \
    ttf-dejavu \
    ttf-droid \
    ttf-font-awesome \
    ttf-hack \
    ttf-liberation \
    ttf-opensans \
    ttf-roboto

AUR \
    nerd-fonts-complete-mono-glyphs \
    ttf-ms-fonts
