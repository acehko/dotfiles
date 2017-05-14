#!/usr/bin/env bash


# Show asciiquarium only if not over ssh
if [[ ! -n $SSH_CONNECTION ]]; then
	asciiquarium
fi
