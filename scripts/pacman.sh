#!/usr/bin/env bash
set -e

# Install packages
echo -e "\\nInstalling packages..."
sudo pacman -S --needed --noconfirm \
    acpi \
    asciiquarium \
    bazel \
    ctags \
    fzf \
    go \
    gvim \
    htop \
    light \
    make \
    neovim \
    nodejs \
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
    yarn \
    zsh

# Install AUR packages
echo -e "\\nInstalling AUR packages..."
yay -S --noconfirm \
    neofetch \
    nerd-fonts-complete-mono-glyphs
