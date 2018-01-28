#!/usr/bin/env bash

ip=$(dig +short myip.opendns.com @resolver1.opendns.com)
echo "#[fg=colour59]$ip "
