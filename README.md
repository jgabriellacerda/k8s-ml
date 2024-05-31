# k8s-ml
Simple ML application using Kubernetes.

Dependencies: [kind](https://kind.sigs.k8s.io/docs/user/quick-start/#installation), [kubectl](https://kubernetes.io/docs/tasks/tools/)

## Quickstart:

Start cluster:

```kind create cluster```

Build app image:

```docker build -t fastapi-app .```

Load image into the cluster:

```kind load docker-image fastapi-app```

Create Pods:

```
kubectl apply -f pod-fastapi-1.yaml
kubectl apply -f pod-fastapi-2.yaml
kubectl apply -f pod-debug.yaml
```

Create Services:

```
kubectl apply -f svc-fastapi-1.yaml
kubectl apply -f svc-fastapi-2.yaml
```


