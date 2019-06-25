NAMESPACE := argocd

port_forward_argocd:
	POD_NAME=$$(kubectl --namespace $(NAMESPACE) get pod -l app.kubernetes.io/name=argocd-server -o template --template="{{(index .items 0).metadata.name}}") && \
        kubectl -n $(NAMESPACE) port-forward $${POD_NAME} 8080:8080
