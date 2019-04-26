#!/usr/bin/env bash
# shellcheck disable=SC1090
set -e

source "$(dirname "$0")/helpers.sh"

echo "Installing gui apps..."
PACMAN \
    firefox \
    thunderbird

AUR \
    franz \
    google-chrome
