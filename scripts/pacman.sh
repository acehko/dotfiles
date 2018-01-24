#!/usr/bin/env bash
set -e

# Install packages
echo -e "\\nInstalling packages..."
sudo pacman -S --needed --noconfirm \
    asciiquarium \
    fzf \
    go \
    make \
    nodejs \
    npm \
    python \
    python-pip \
    python2 \
    ripgrep \
    shellcheck \
    tmux \
    the_silver_searcher \
    vim \
    xclip \
    yaourt \
    zsh

# Install AUR packages
echo -e "\\nInstalling AUR packages..."
yaourt -S --needed --noconfirm \
    neofetch
