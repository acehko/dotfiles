#!/usr/bin/env bash


# Install packages
echo -e "\nInstalling packages..."
sudo pacman -S --needed --noconfirm \
    asciiquarium \
    fzf \
    go \
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
    zsh


# Install AUR packages
echo -e "\nInstalling AUR packages..."
yaourt -S --needed --noconfirm \
    neofetch
