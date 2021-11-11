#!/bin/bash
export KUBE_VAR=$(terraform output --raw kubeconfig)
echo $KUBE_VAR | base64 -d > ~/.kube/lke_cluster_config.yaml
export KUBECONFIG=~/.kube/lke_cluster_config.yaml
chmod go-r ~/.kube/lke_cluster_config.yaml
