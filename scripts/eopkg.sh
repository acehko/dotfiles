#!/usr/bin/env bash
set -e

# Install packages
echo -e "\\nInstalling packages..."
sudo eopkg install -y \
    fzf \
    golang \
    make \
    neofetch \
    neovim \
    nodejs \
    pip \
    ripgrep \
    shellcheck \
    tmux \
    vim \
    yarn \
    zsh
