#!/usr/bin/env bash

context="$(kubectl config current-context)"
if [ "$context" != "minikube" ]; then
    echo "[k8s: $context] "
fi
