#!/usr/bin/env bash

if ip=$(dig +short myip.opendns.com @resolver1.opendns.com); then
    echo "#[fg=colour59,bg=colour233]$ip "
fi
