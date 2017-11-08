#!/usr/bin/env bash


# Install node modules
echo -e "\nInstalling node modules..."
sudo npm i -g \
    jshint \
    js-beautify \
    livedown \
    typescript \
    typescript-formatter
