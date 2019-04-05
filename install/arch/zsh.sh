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
zsh -c "source $DOTFILES_ZSH/plugins/plugins.zsh"

# Link zsh config
echo
echo "Linking zsh config..."
for file in ".zprofile" ".zshenv" ".zshrc"; do
    ln -sf "$DOTFILES_ZSH/$file" "$HOME/$file"
    echo "$file"
done
