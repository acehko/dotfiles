#!/usr/bin/env bash
set -e

# Install python packages
echo -e "\\nInstalling python packages..."
sudo pip3 install \
    vim-vint \
    yamllint
