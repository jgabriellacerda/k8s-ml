# k8s-ml
Simple ML application using Kubernetes.

Dependencies: [kind](https://kind.sigs.k8s.io/docs/user/quick-start/#installation), [kubectl](https://kubernetes.io/docs/tasks/tools/)

## Quickstart:

Start cluster:

```
kind create cluster
```

Build app image:

```
docker build -t fastapi-app .
```

Load image into the cluster:

```
kind load docker-image fastapi-app
```

Create Pods:

```
kubectl apply -f k8s/pods/fastapi-1.yaml
kubectl apply -f k8s/pods/fastapi-2.yaml
kubectl apply -f k8s/pods/debug.yaml
```

Create Services:

```
kubectl apply -f k8s/services/fastapi-1.yaml
kubectl apply -f k8s/services/fastapi-2.yaml
```

Create Deployment:

```
kubectl apply -f k8s/deployments/fastapi-2.yaml
```

## Dashboard:

```
kubectl apply -f k8s/dashboard/recommended.yaml
kubectl apply -f k8s/service-accounts/service_account.yaml
kubectl apply -f k8s/role-bindings/role_binding.yaml
kubectl -n kubernetes-dashboard create token admin-user
kubectl proxy
```

Access from browser: ```http://localhost:8001/api/v1/namespaces/kubernetes-dashboard/services/https:kubernetes-dashboard:/proxy/#/login```

## Metrics:

```
kubectl apply -f metrics-server-components.yaml
```