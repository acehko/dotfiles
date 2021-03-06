#!/usr/bin/env zsh

# Custom functions

# Run a command forever
# Options:
#   - s N : sleep for N before restarting
forever() {
    if [[ "$1" = "-s" ]]; then
        local s=$2
        local args=${@:3}
    else
        local args=$@
    fi

    while true; do
        eval $args
        if [[ ! -z $s ]]; then
            sleep $s
        fi
    done
}
