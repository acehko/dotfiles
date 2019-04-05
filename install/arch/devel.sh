#!/usr/bin/env bash
# shellcheck disable=SC1090
set -e

source "$(dirname "$0")/helpers.sh"

echo -e "\\nInstalling development tools..."
PACMAN \
    bazel \
    ctags \
    make

# Go
echo -e "\\nInstalling go..."
PACMAN \
    go

# Node.js
echo -e "\\nInstalling nodejs..."
PACMAN \
    nodejs

# Python
echo -e "\\nInstalling python..."
PACMAN \
    python \
    python-pip \
    python2 \
    python2-pip
