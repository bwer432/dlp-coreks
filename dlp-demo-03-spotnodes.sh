region=us-west-1
cluster=terraform-2022w11
eksctl create nodegroup --cluster=$cluster --region=$region --managed --spot --name=spot-nodegroup --instance-types=m5.large,m4.large,m5d.large,m5a.large,m5ad.large,m5n.large,m5dn.large

