Demo steps:
aws eks describe-cluster --name terraform-2022w11 --region us-west-1    # or similar – change your cluster name and region to match your EKS cluster

# focus on some key properties
aws eks describe-cluster --name terraform-2022w11 --region us-west-1 --query cluster.[endpoint,roleArn,certificateAuthority.data] | cut -c 1-80

eks=$(aws eks describe-cluster --name terraform-2022w11 --region us-west-1 --query cluster.endpoint | sed -e 's/"//g')
echo $eks
grep server: ~/.kube/config
kubectl config view --minify

kubectl get --raw /
kubectl get --raw /api

Either:
aws eks describe-cluster --name terraform-2022w11 --region us-west-1 --query cluster.resourcesVpcConfig
vpcId=$(aws eks describe-cluster --name terraform-2022w11 --region us-west-1 --query cluster.resourcesVpcConfig.vpcId --output text)
aws ec2 describe-security-groups --region us-west-1 --filters Name=vpc-id,Values=$vpcId

# generic form without filter - aws ec2 describe-security-groups --region us-west-1   # or whatever region your EKS cluster is in
Or: show them the Security Groups associated with your EKS cluster to indicate the control plane access from your Amazon EKS cluster’s VPC to and from the control plane.

