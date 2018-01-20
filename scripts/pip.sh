#!/usr/bin/env bash
set -e

# Install python packages
echo -e "\\nInstalling python packages..."
sudo pip install \
    vim-vint \
    yamllint
