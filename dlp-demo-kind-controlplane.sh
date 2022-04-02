Demo steps:
In order to adequately understand the value of Amazon EKS, it is important to understand the alternatives. A quick and easy way to deploy a small Kubernetes cluster for contrast is KinD. This can be installed on the Cloud9 instance you use for demonstrations.

# if you haven’t already, install KinD
curl -Lo ./kind https://kind.sigs.k8s.io/dl/v0.11.1/kind-linux-amd64
chmod +x ./kind
sudo mv ./kind /usr/local/bin/kind

# create a ONE NODE cluster – unless you already have one
kind create cluster

kubectl cluster-info --context kind-kind
kubectl config get-contexts
kubectl get componentstatuses
kubectl get nodes

kubectl get ns
kubectl get pods -n kube-system -l tier=control-plane
kubectl get pods -n kube-system -l tier=control-plane -o jsonpath={.items[*].status.hostIP}
kubectl get pods -n kube-system kube-apiserver-kind-control-plane -o yaml >kube-apiserver.yaml

# get pod specs for the control plane pods
for cpp in $(kubectl get pods -n kube-system -l tier=control-plane -o jsonpath={.items[*].metadata.name}); do kubectl get pod -n kube-system $cpp -o yaml >$(echo $cpp | sed -e 's/-kind-control-plane//').yaml; done
# open one or more of those in the Cloud9 editor and highlight key ingredients such s port numbers those services are listening on.

# show them as little or as much as you feel time allows
# optionally delete the kind cluster when done
kubectl config view
kind delete cluster
kubectl config get-contexts
kubectl config use-context bwer@terraform-2022w11.us-west-1.eksctl.io   # or similar





