#!/usr/bin/env bash


# Install packages
echo -e "\nInstalling packages..."
sudo pacman -S --needed --noconfirm \
	clang \
	cmake \
	go \
	gvim \
	nodejs \
	npm \
	make \
	python \
	python2 \
	tmux \
	zsh
