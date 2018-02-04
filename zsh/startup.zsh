#!/usr/bin/env zsh

run_ssh() {
    cmd=$1
    sess=$2

    host=$(echo "$sess" | cut -d "-" -f 2)
    if [[ -n $host ]]; then
        if grep -q "Host $host" "$HOME/.ssh/config"; then
            $cmd "$host"
        else
            echo "Invalid hostname: $host"
        fi
    fi
}

# Running in tmux
if [[ -n $TMUX ]]; then
    sess=$(tmux display-message -p "#S")
    if [[ $sess == ssh-* ]]; then
        run_ssh "ssh" "$sess"
    elif [[ $sess == mosh-* ]]; then
        run_ssh "mosh" "$sess"
    fi
else
    neofetch
fi
