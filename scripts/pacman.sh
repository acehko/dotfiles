#!/usr/bin/env bash
set -e

# Install packages
echo -e "\\nInstalling packages..."
sudo pacman -S --needed --noconfirm \
    acpi \
    asciiquarium \
    fzf \
    go \
    gvim \
    make \
    neovim \
    nodejs \
    npm \
    python \
    python-neovim \
    python-pip \
    python2 \
    python2-neovim \
    ripgrep \
    shellcheck \
    tmux \
    the_silver_searcher \
    xclip \
    yaourt \
    yarn \
    zsh

# Install AUR packages
echo -e "\\nInstalling AUR packages..."
yaourt -S --needed --noconfirm \
    neofetch
