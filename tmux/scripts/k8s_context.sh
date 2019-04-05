#!/usr/bin/env bash

context="$(kubectl config current-context)"
if [[ $context != "minikube" && $context != "" ]]; then
    echo "#[fg=$COLOR_TMUX_BLUE]k8s: $context "
fi
