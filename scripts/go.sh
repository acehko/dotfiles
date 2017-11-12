#!/usr/bin/env bash


# Install go packages
echo -e "\nInstalling go packages..."
go get -u \
    github.com/bazelbuild/buildtools/buildifier
