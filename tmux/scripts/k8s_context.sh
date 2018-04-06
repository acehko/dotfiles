#!/usr/bin/env bash

context="$(kubectl config current-context)"
if [[ $context != "minikube" && $context != "" ]]; then
    echo "#[fg=colour$COLOR_BLUE,bg=colour$COLOR_BLACK][k8s: $context] "
fi
