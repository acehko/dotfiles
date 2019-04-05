#!/usr/bin/env bash
# shellcheck disable=SC1090
set -e

source "$(dirname "$0")/helpers.sh"

echo "Installing tmux..."
PACMAN tmux

echo
echo "Linking tmux config..."
LINK "$DOTFILES/tmux" "$HOME" ".tmux.conf"

# Install Tmux Pluin Manager
echo
echo "Installing TPM..."
rm -rf "$HOME/.tmux/plugins/tpm"
git clone "https://github.com/tmux-plugins/tpm" "$HOME/.tmux/plugins/tpm"
# Create a new tmux session
tmux has &>/dev/null || tmux new-session -d -s main

# Initialize TPM
tmux source-file "$DOTFILES/tmux/.tmux.conf"

# Install plugins
echo
echo "Installing tmux plugins..."
source "$HOME/.tmux/plugins/tpm/bin/install_plugins"
source "$HOME/.tmux/plugins/tpm/bin/update_plugins" all
