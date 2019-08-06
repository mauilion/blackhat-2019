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

# hide the evidence
clear


# put your demo awesomeness here
#if [ ! -d "stuff" ]; then
#  pe "mkdir stuff"
#fi

#pe "cd stuff"

p "let's try to deploy some of these attack pods with a more restrictive psp policy in place."
pe "kubectl delete clusterrolebinding allow-all-kube-system"
pe "kubectl create ns secure"
pe "kubectl create rolebinding secure-admin -n secure --clusterrole=admin --serviceaccount=secure:default"
p "let's try to deploy the etcdclient.yaml"
pe "kubectl apply -n secure -f etcd-attack/etcdclient.yaml --as system:serviceaccount:secure:default"
p "what about the dind manifest"
pe "kubectl apply -n secure -f dind/dind-no-privs.yaml --as system:serviceaccount:secure:default"
p "we can still deploy reasonable things though! let's try nginx"
pe "kubectl create -n secure deployment nginx  --image=nginx:stable --as system:serviceaccount:secure:default"
pe "kubectl scale -n secure deployment nginx --replicas=3 --as system:serviceaccount:secure:default"
pe "kubectl get pods -n secure"
pe "kubectl delete ns -n secure --wait=false"
# show a prompt so as not to reveal our true nature after
# the demo has concluded
p ""
