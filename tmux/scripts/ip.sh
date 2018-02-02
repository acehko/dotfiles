#!/usr/bin/env bash

if ip=$(dig +short myip.opendns.com @resolver1.opendns.com); then
    echo "#[fg=colour$COLOR_GREY,bg=colour$COLOR_BLACK]$ip "
fi
