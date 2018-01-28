#!/usr/bin/env bash

context="$(kubectl config current-context)"
if [ "$context" != "minikube" ]; then
    echo "#[fg=colour110,bg=colour233][k8s: $context] "
fi
