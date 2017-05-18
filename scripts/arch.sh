#!/usr/bin/env bash


# Install packages
echo -e "\nInstalling packages..."
sudo pacman -S --needed --noconfirm \
	asciiquarium \
	clang \
	cmake \
	go \
	make \
	mosh \
	neovim \
	nodejs \
	npm \
	python \
	python-neovim \
	python2 \
	python2-neovim \
	tmux \
	xclip \
	yaourt \
	zsh


# Install AUR packages
echo -e "\nInstalling AUR packages..."
yaourt -S --needed --noconfirm \
	neofetch
