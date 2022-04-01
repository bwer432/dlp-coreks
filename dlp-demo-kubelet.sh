# KUBELET demo:
hostname
# now in the node
PS1="k8s-node> "
lsns
ps -ef | grep kubelet
cat /etc/kubernetes/kubelet/kubelet-config.json
cat /etc/resolv.conf

lsns 
sudo bash
lsns 
pstree
ps f -e

exit   # out of sudo
exit   # out of aws ssm start-session (node)

# stop now
# below this line is extra yummy dashboard and monitoring goodness

# Amazon EKS user guide
https://docs.aws.amazon.com/eks/latest/userguide/eks-ug.pdf

kubectl apply -f https://raw.githubusercontent.com/kubernetes/dashboard/v2.0.5/aio/deploy/recommended.yaml 
cat <<EOF >eks-admin-sa.yaml
apiVersion: v1 
kind: ServiceAccount 
metadata: 
  name: eks-admin 
  namespace: kube-system 
--- 
apiVersion: rbac.authorization.k8s.io/v1beta1 
kind: ClusterRoleBinding 
metadata: 
  name: eks-admin 
roleRef: 
  apiGroup: rbac.authorization.k8s.io 
  kind: ClusterRole 
  name: cluster-admin 
subjects: 
- kind: ServiceAccount
  name: eks-admin 
  namespace: kube-system 
EOF

kubectl apply -f eks-admin-service-account.yaml 
kubectl -n kube-system describe secret $(kubectl -n kube-system get secret | grep eks- admin | awk '{print $1}’) 
Copy the token
# on a LOCAL SHELL – not Cloud9:
kubectl proxy 
# browse to:
http://localhost:8001/api/v1/namespaces/kubernetes-dashboard/services/https:kubernetes-dashboard:/ proxy/#!/login
Chose Token authentication and paste the token from the describe secret results

# install metrics server
kubectl apply -f https://github.com/kubernetes-sigs/metrics-server/releases/latest/ download/components.yaml 
kubectl get deployment metrics-server -n kube-system 

