#!/usr/bin/env bash


# Install packages
echo -e "\nInstalling packages..."
sudo pacman -S --needed --noconfirm \
    asciiquarium \
    clang \
    cmake \
    fzf \
    go \
    make \
    mosh \
    neovim \
    nodejs \
    npm \
    python \
    python-neovim \
    python-pip \
    python2 \
    python2-neovim \
    ripgrep \
    tmux \
    the_silver_searcher \
    xclip \
    yaourt \
    zsh


# Install AUR packages
echo -e "\nInstalling AUR packages..."
yaourt -S --needed --noconfirm \
    neofetch
