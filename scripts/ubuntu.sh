#!/usr/bin/env bash


# PPA
echo -e "\nAdding PPAs..."
sudo add-apt-repository -y ppa:gophers/archive     # Golang
sudo add-apt-repository -y ppa:neovim-ppa/unstable # Neovim
sudo add-apt-repository -y ppa:pi-rho/dev          # Tmux
sudo add-apt-repository -y ppa:ytvwld/asciiquarium # Asciiquarium
sudo add-apt-repository -y ppa:keithw/mosh         # Mosh
sudo add-apt-repository -y ppa:dawidd0811/neofetch # Neofetch


# Node.js
echo -e "\nAdding Node.js package repo..."
curl -sL https://deb.nodesource.com/setup_7.x | sudo -E bash -


# Install packages
echo -e "\nInstalling packages..."
sudo apt-get update; \
	sudo apt-get install -y \
		asciiquarium \
		build-essential \
		cmake \
		golang-1.8 \
		mosh \
		neofetch \
		neovim \
		nodejs \
		python-dev \
		python-neovim \
		python3-dev \
		python3-neovim \
		tmux-next \
		xclip \
		zsh


# Symlink tmux to tmux-next
if [ ! -e /usr/bin/tmux ]; then
	sudo ln -s /usr/bin/tmux-next /usr/bin/tmux
fi

# Symlink go binary
if [ ! -e /usr/bin/go ]; then
	sudo ln -s /usr/lib/go-1.8/bin/go /usr/bin/go
fi
