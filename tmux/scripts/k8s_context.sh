#!/usr/bin/env bash

context="$(kubectl config current-context)"
if [[ $context != "minikube" && $context != "" ]]; then
    echo "#[fg=colour6]k8s: $context "
fi
