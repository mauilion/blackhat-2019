#!/bin/bash
echo "cache all the images for our cluster"
cat images/images | xargs -P0 -n1 -I {} docker pull {}

echo "delete old cluster"
kind delete cluster

echo "create the cluster"
kind create cluster --config kind/config

echo "push the images into the kind cluster this takes about 5 minutes"
time cat images/images | xargs -P2 -n1 -I {} kind load docker-image {}

echo "fix the sysctls for calico"
kind get nodes | xargs -n1 -I {} docker exec {} sysctl -w net.ipv4.conf.all.rp_filter=0


echo "apply cni manifests"
kubectl apply -f kind/canal.yaml

echo "apply Pod Security Policys"
kubectl apply -f psp/

echo "done it's demo time!"
