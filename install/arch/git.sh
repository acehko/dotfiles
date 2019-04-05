#!/usr/bin/env bash
# shellcheck disable=SC1090
set -e

source "$(dirname "$0")/helpers.sh"

echo "Installing git..."
PACMAN \
    git

echo
echo "Linking git config..."
LINK "$DOTFILES/git" "$HOME" ".gitconfig" ".gitignore_global"
