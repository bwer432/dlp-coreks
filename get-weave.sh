k8sVersionTag=$(kubectl version | base64 | tr -d '\n')
curl https://cloud.weave.works/k8s/net?k8s-version=$k8sVersionTag >weave-net.yaml

