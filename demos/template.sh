#!/usr/bin/env bash

########################
# include the magic
########################
. ../lib/demo-magic.sh


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

# hide the evidence
clear


# put your demo awesomeness here
#if [ ! -d "stuff" ]; then
#  pe "mkdir stuff"
#fi

#pe "cd stuff"

pe "kubectl apply -f stars/"
pe "kubectl get pods -A | grep -v kube-system"
pe "kubectl delete --wait=false -f stars/"

p "etcd attack demo"

pe "kubectl apply -f etcd-attack/"

p "This pod is directly scheduled on a control plane node"
p "let's take a look"
pe "vim etcd-attack/etcdclient.yaml"
pe "kubectl exec -ti etcdclient sh"

# show a prompt so as not to reveal our true nature after
# the demo has concluded
p ""
