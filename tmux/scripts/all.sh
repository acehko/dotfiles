#!/usr/bin/env bash

battery=$("$DOTFILES/tmux/scripts/battery.sh")
ip=$("$DOTFILES/tmux/scripts/ip.sh")
cpu=$("$DOTFILES/tmux/scripts/cpu.sh")
mem=$("$DOTFILES/tmux/scripts/mem.sh")
net=$("$DOTFILES/tmux/scripts/network.sh")
k8s=$("$DOTFILES/tmux/scripts/k8s_context.sh")

echo "${battery}${ip}${cpu}${mem}${net}${k8s}"
