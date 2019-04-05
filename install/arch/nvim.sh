#!/usr/bin/env bash
# shellcheck disable=SC1090
set -e

source "$(dirname "$0")/helpers.sh"

echo "Installing neovim..."
PACMAN \
    gvim \
    neovim \
    python-neovim

echo
echo "Linking neovim config..."
LINK "$DOTFILES/nvim" "$XDG_CONFIG_HOME/nvim" "init.vim"

# Install Vim-Plug
echo
echo "Installing Vim-Plug..."
curl -Lo "$HOME/.local/share/nvim/site/autoload/plug.vim" --create-dirs \
    "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"

# Install plugins
echo
echo "Installing vim plugins..."
nvim="nvim -u $DOTFILES/nvim/plugins/plugins.vim"
$nvim +PlugClean! +qa
$nvim +PlugUpdate +qa
$nvim +UpdateRemotePlugins +qa
