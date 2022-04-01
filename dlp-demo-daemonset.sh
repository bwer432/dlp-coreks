# DAEMONSET demo
kubectl get daemonset -n kube-system
kubectl get daemonset
kubectl get daemonset -n kube-system
kubectl get pods -n kube-system -l k8s-app=kube-proxy
kubectl get pods -n kube-system -l k8s-app=aws-node
kubectl get pods -n kube-system -l k8s-app=aws-node -o wide
kubectl get configmap -n kube-system
kubectl get configmap -n kube-system kube-proxy -o yaml
kubectl get configmap -n kube-system kube-proxy-config -o yaml
kubectl get deploy -n kube-system
kubectl get deploy -n kube-system coredns
kubectl get configmap -n kube-system coredns -o yaml
