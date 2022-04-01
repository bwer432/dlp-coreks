# Deployment demo - part 2 - upgrading the deployment 

cat <<EOF >index2.php
<?php
  echo getenv("GREETING") . " " . gethostname() . " at " . $_SERVER['SERVER_ADDR'] . " back to " . $_SERVER['REMOTE_ADDR'] . "\n";
?>
EOF

cat <<EOF >Dockerfile-with-ip
FROM php:8.0.1-apache
COPY index2.php /var/www/html/index.php
ENV GREETING="Hello from"
RUN chmod a+rx index.php
EOF

docker build -f Dockerfile-with-ip -t dlpdemo:1.1.0 .                                                     
docker tag dlpdemo:1.1.0 $repo:1.1.0
docker push $repo:1.1.0

kubectl rollout history deployment/dlpdemo -n dlpdemo-prod

kubectl set image deployment/dlpdemo -n dlpdemo-prod dlpdemo=$repo:1.1.0
kubectl rollout status deployment/dlpdemo -n dlpdemo-prod
kubectl rollout history deployment/dlpdemo -n dlpdemo-prod
kubectl get deployment/dlpdemo -n dlpdemo-prod -o yaml | grep image:
kubectl get rs -n dlpdemo-prod
