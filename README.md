## Resources for [The path less traveled: Abusing Kubernetes Defaults](https://www.blackhat.com/us-19/briefings/schedule/index.html#the-path-less-traveled-abusing-kubernetes-defaults-17049)

This repo has all of the manifests and demo scripts used for this presentation.

The cluster was built using kind.sigs.k8s.io and run entirely from the presenter laptop.

You can run the [setup.sh](./setup.sh) script to populate the images that will be used

Run all of the demo scripts from the root directory of this repo.

The `k8s_root` and `dind` demos do require that the laptop be running some linux distribution and docker.

For both of these examples we are joining the laptop to the kind cluster as a node.


Other resources.

report a vuln [k8s.io/security](k8s.io/security)
ask questions! [slack.k8s.io](slack.k8s.io) #security and #sig-auth
cve's are announed as part of the [announce google group](https://groups.google.com/forum/#!forum/kubernetes-announce)


Any questions or feedback please reach out!

[Duffie Cooley](twitter.com/mauilion) and [Ian Coldwater](twitter.com/IanColdwater)
