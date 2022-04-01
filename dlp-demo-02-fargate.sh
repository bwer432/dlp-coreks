# demo AWS Fargate profile
region=us-west-1
cluster=terraform-2022w11

# clean up old profile, if any
eksctl delete fargateprofile --cluster $cluster --region $region hobbit

# show a fargate profile configuration
# make any changes to the region, cluster, role, account in role, subnets, etc.
vi dlp-demo-fargate.yaml

# show the current hobbit deployment, pods, and then the nodes
kubectl get deploy hobbit -n hobbits
kubectl get pods -n hobbits -o wide
kubectl get nodes

# create a new fargate profile
eksctl create fargateprofile -f dlp-demo-fargate.yaml 

# tell the deployment to actually use it... otherwise the same pods persist
kubectl rollout restart deploy/hobbit -n hobbits

kubectl get nodes
kubectl get pods -n hobbits -o wide

