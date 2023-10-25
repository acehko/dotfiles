#!/usr/bin/env zsh

# Homebrew
eval "$(/opt/homebrew/bin/brew shellenv)"

# Python
PYTHON_BIN_PATH="$(python3 -m site --user-base)/bin"
PATH="$PATH:$PYTHON_BIN_PATH"
