#!/usr/bin/env bash

# Stop already running instances
killall -q polybar

# Wait until stopped
while pgrep -u $UID -x polybar >/dev/null; do
    sleep 1
done

# Launch polybar
polybar main &
