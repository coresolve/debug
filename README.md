[![Docker Repository on Quay](https://quay.io/repository/dcooley/debug/status "Docker Repository on Quay")](https://quay.io/repository/dcooley/debug)

This is meant to be used as a debug container.

You can invoke it with:

``` bash
kubectl run debug -ti --image=quay.io/dcooley/debug:latest --restart=Never --image-pull-policy=Always -- /bin/bash
```

When you exit the container you can reconnect with:

`kubectl exec -ti debug -- /bin/bash`

When finished you can delete it with:

`kubectl delete pod debug`

There is a recent version of kubectl on the pod as well as `curl` `dig` `bash` and `tshark`.

If you want kubectl to do useful things you will want to create a reasonable service account and role binding. 
For example:

``` bash
kubectl create serviceaccount debug
kubectl create clusterrolebinding debug --clusterrole=admin --serviceaccount=default:debug
kubectl run debug -ti --image=quay.io/dcooley/debug --image-pull-policy=Always --overrides='{ "spec": { "serviceAccountName": "debug" } }'   --restart=Never -- /bin/bash
```



Have a bunch of fun!
