# Demo steps:
kubectl run jumpbox --image=nginx
kubectl exec -it jumpbox  -- bash
for i in /proc/[0-9]*/cmdline; do echo $i; cat $i; echo; done
ls -l /usr/share/nginx/html
lsns
exit

