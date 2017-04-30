#!/usr/bin/env bash


# Install packages
echo -e "\nInstalling packages..."
sudo pacman -S --noconfirm \
	clang \
	cmake \
	go \
	nodejs \
	npm \
	make \
	python \
	python2 \
	tmux \
	vim \
	zsh
