#!/usr/bin/env bash
# shellcheck disable=SC1090
set -e

source "$(dirname "$0")/helpers.sh"

echo "Installing redshift..."
PACMAN \
    redshift

echo
echo "Linking redshift config..."
LINK "$DOTFILES/redshift" "$XDG_CONFIG_HOME" "redshift.conf"
