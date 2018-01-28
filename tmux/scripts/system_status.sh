#!/usr/bin/env bash
# shellcheck disable=SC1090

cpu=$("$DOTFILES/tmux/scripts/cpu.sh")
mem=$("$DOTFILES/tmux/scripts/mem.sh")
net=$("$DOTFILES/tmux/scripts/network.sh")

echo "${cpu}${mem}${net}"
