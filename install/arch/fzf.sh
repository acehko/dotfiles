#!/usr/bin/env bash
# shellcheck disable=SC1090
set -e

source "$(dirname "$0")/helpers.sh"

echo "Installing fzf..."
PACMAN \
    fzf \
    ripgrep \
    the_silver_searcher
