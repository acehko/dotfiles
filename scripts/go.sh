#!/usr/bin/env bash
set -e

# Install go packages
echo -e "\\nInstalling go packages..."
go get -u \
    github.com/bazelbuild/buildtools/buildifier \
    github.com/golang/dep/cmd/dep \
    mvdan.cc/sh/cmd/shfmt
