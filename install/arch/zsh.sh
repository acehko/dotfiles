#!/usr/bin/env bash
# shellcheck disable=SC1090
set -e

source "$(dirname "$0")/helpers.sh"

echo "Installing zsh..."
PACMAN \
    zsh

# Install Antigen
ANITGEN_LOCATION="$HOME/.zsh/antigen/antigen.zsh"

echo
echo "Installing Antigen..."
curl -Lo "$ANITGEN_LOCATION" --create-dirs git.io/antigen

# Install plugins
echo
echo "Installing zsh plugins..."
zsh -c "source $DOTFILES/zsh/plugins/plugins.zsh"

# Link zsh config
echo
echo "Linking zsh config..."
LINK "$DOTFILES/zsh" "$HOME" ".zprofile" ".zshenv" ".zshrc"
