#!/usr/bin/env bash

# PPA
sudo add-apt-repository -y ppa:longsleep/golang-backports # Golang
sudo add-apt-repository -y ppa:jonathonf/vim              # Vim
sudo add-apt-repository -y ppa:pi-rho/dev                 # Tmux


# Node.js
curl -sL https://deb.nodesource.com/setup_7.x | sudo -E bash -


# Install packages
sudo apt-get update && \
	sudo apt-get install -y \
		build-essential \
		cmake \
		golang-go \
		nodejs \
		python-dev \
		python3-dev \
		tmux \
		vim \
		vim-nox \
		zsh
