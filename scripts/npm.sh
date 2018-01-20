#!/usr/bin/env bash
set -e

# Install node modules
echo -e "\\nInstalling node modules..."
sudo npm i -g \
    eslint \
    livedown \
    typescript \
    yarn
