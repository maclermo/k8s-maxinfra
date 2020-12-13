#!/bin/sh

if [ -z "$1" ]; then
  echo "Usage: ./parse.sh <IMAGE>"
  exit 1
fi

docker image rm k8s-maxinfra/$1
docker build -t k8s-maxinfra/$1 /kube/k8s-maxinfra/deployments/$1/.
kubectl delete -f /kube/k8s-maxinfra/definitions/$1.yaml
kubectl apply -f /kube/k8s-maxinfra/definitions/$1.yaml
