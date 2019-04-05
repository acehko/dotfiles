#!/usr/bin/env bash

# Stop already running instances
killall -q polybar

# Wait until stopped
while pgrep -u $UID -x polybar >/dev/null; do
    sleep 1
done

source /home/andrija/dotfiles/zsh/config/colors.zsh

# Launch polybar
polybar main &
polybar secondary &
