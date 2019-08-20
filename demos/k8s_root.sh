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

kubectl create deployment nginx --image=nginx:stable
kubectl scale deployment nginx --replicas 5
kubectl get pods
clear


# put your demo awesomeness here
#if [ ! -d "stuff" ]; then
#  pe "mkdir stuff"
#fi

#pe "cd stuff"

pe "vim k8s_root/r00t.yaml"
pe "kubectl apply -f k8s_root/r00t.yaml"
pe "kubectl exec -it r00t -- nsenter --help"
p "I've used nsenter to solve the mystery of how a pod is actually configured"
p "first let's find the pid of an nginx process"
pe "kubectl exec -ti r00t -- pgrep -a nginx"
pe "kubectl exec -ti r00t -- nsenter -n -t $(pgrep nginx | head -n1) ss -ln"
pe "kubectl exec -ti r00t -- nsenter -m -t $(pgrep nginx | head -n1) cat /etc/nginx/nginx.conf"
p "this all works because every process has a /proc/PID/ns directory with a mapping of the namespaces that the process is bound to"
pe "kubectl exec -ti r00t -- ls -al /proc/$(pgrep nginx| head -n 1)/ns"
p "but what else can we do here?"
p "linux is namespacing all the things all the time not just containers"
p "we can use nsenter to take over the node without hostPath!"
pe "kubectl exec -it r00t -- nsenter -a -t 1 bash"



# show a prompt so as not to reveal our true nature after
# the demo has concluded
p ""
