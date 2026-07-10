# kubernetes

Mock manifests for a simple stateless web app: Deployment → Service → Ingress,
tied together with Kustomize.

## Apply

```bash
# apply everything via kustomize
kubectl apply -k kubernetes/

# or individually
kubectl apply -f kubernetes/deployment.yaml
kubectl apply -f kubernetes/service.yaml
kubectl apply -f kubernetes/ingress.yaml
```

## Inspect

```bash
kubectl get pods -l app=web
kubectl rollout status deployment/web
kubectl logs -l app=web --tail=50
```

Replace the image (`nginx:1.27-alpine`), host (`web.example.com`), and port (`8080`)
with your own before applying.
