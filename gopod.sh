 kubectl run jumpbox --image=nginx
 kubectl get pods
 kubectl get pods -o wide
 node=`kubectl get pod jumpbox -o jsonpath={.status.hostIP}`
 kubectl get nodes
 aws ec2 describe-instances --query 'Reservations[].Instances[].[InstanceId,PrivateIpAddress]' --output text  --region us-west-1
 aws ec2 describe-instances --region us-west-1 --query "Reservations[].Instances[?PrivateIpAddress=='$node'].InstanceId" --output text
 instance=$(aws ec2 describe-instances --region us-west-1 --query "Reservations[].Instances[?PrivateIpAddress=='$node'].InstanceId" --output text)
 aws ssm start-session --region us-west-1 --target $instance

