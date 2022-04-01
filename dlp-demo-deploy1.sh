## Deployment demo

cat <<EOF >index.php 
<?php
  echo getenv("GREETING") . " " . gethostname() . "\n";
?>
EOF

cat <<EOF >Dockerfile 
FROM php:8.0.1-apache
COPY index.php /var/www/html/
ENV GREETING="Hello from"
RUN chmod a+rx index.php
EOF

docker build --tag dlpdemo:1.0.0 .

region=us-west-1
aws ecr create-repository --repository-name dlpdemo --region $region
repo=$(aws ecr describe-repositories --repository-name dlpdemo --region $region --query repositories[].repositoryUri --output text)
registry=$(echo $repo | sed -e 's@/dlpdemo@@')
aws ecr get-login-password --region $region | docker login --username AWS --password-stdin $registry
docker tag dlpdemo:1.0.0 $repo:1.0.0
docker push $repo:1.0.0

kubectl create deployment dlpdemo --image=$repo:1.0.0 --replicas=3 -n dlpdemo-prod
kubectl get deployments,replicasets,pods -n dlpdemo-prod

