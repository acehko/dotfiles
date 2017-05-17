#!/usr/bin/env bash


# PPA
echo -e "\nAdding PPAs..."
sudo add-apt-repository -y ppa:longsleep/golang-backports # Golang
sudo add-apt-repository -y ppa:jonathonf/vim              # Vim
sudo add-apt-repository -y ppa:pi-rho/dev                 # Tmux
sudo add-apt-repository -y ppa:ytvwld/asciiquarium        # Asciiquarium
sudo add-apt-repository -y ppa:keithw/mosh                # Mosh
sudo add-apt-repository -y ppa:dawidd0811/neofetch        # Neofetch


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
		golang-go \
		mosh \
		neofetch \
		nodejs \
		python-dev \
		python3-dev \
		tmux-next \
		vim-gtk \
		vim-nox \
		xclip \
		zsh


# Symlink tmux to tmux-next
if [ ! -e /usr/bin/tmux ]; then
	sudo ln -s /usr/bin/tmux-next /usr/bin/tmux
fi
