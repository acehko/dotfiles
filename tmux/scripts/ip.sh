#!/usr/bin/env bash

if ip=$(dig +short myip.opendns.com @resolver1.opendns.com); then
    echo "#[fg=$COLOR_TMUX_BRIGHT_BLACK]$ip "
fi
