# Demo steps:
kubectl get namespaces
kubectl api-resources >apires.txt
# open apires.txt in Cloud9 editor
grep Namespace apires.txt
kubectl create ns dlpdemo-test
cat <<EOF >create-dlpdemo-dev-ns.yaml
apiVersion: v1
kind: Namespace
metadata:
  labels:
    app: dlpdemo
    stage: dev
  name: dlpdemo-dev
EOF
cat <<EOF >create-dlpdemo-prod-ns.yaml
apiVersion: v1
kind: Namespace
metadata:
  labels:
    app: dlpdemo
    stage: prod
  name: dlpdemo-prod
EOF
kubectl apply -f create-dlpdemo-dev-ns.yaml
kubectl apply -f create-dlpdemo-prod-ns.yaml
kubectl get ns

kubectl delete pod jumpbox
kubectl run jumpbox --image nginx -n dlpdemo-dev
kubectl get pods
kubectl get pods -n dlpdemo-dev


