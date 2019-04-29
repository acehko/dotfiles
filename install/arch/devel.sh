#!/usr/bin/env bash
# shellcheck disable=SC1090
set -e

source "$(dirname "$0")/helpers.sh"

echo "Installing development tools..."
PACMAN \
    bazel \
    ctags \
    make \
    shellcheck

# Go
echo
echo "Installing go..."
PACMAN \
    go

# Node.js
echo
echo "Installing nodejs..."
PACMAN \
    nodejs

# Python
echo
echo "Installing python..."
PACMAN \
    python \
    python-pip \
    python2 \
    python2-pip

# Ruby
echo
echo "Installing ruby..."
PACMAN \
    ruby

# Docker
echo
echo "Installing docker..."
PACMAN \
    docker

sudo groupadd docker || true
sudo usermod -aG docker "$USER"
