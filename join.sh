#!/bin/bash
sudo systemctl unmask kubelet
token=$(docker exec kind-control-plane kubeadm token create --print-join-command)
sudo ${token} --ignore-preflight-errors=all
