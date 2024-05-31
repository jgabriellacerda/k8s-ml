# k8s-ml
Simple ML application using Kubernetes.

docker build -t fastapi-app .
kind load docker-image fastapi-app
kubectl apply -f pod-fastapi-1.yaml
kubectl apply -f pod-fastapi-2.yaml
kubectl apply -f svc-fastapi-1.yaml
kubectl apply -f svc-fastapi-2.yaml
kubectl apply -f pod-debug.yaml