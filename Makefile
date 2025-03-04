KUBE = kubectl -n kubernates-tutorial

deploy.setup:
		kubectl create namespace kubernates-tutorial

deploy.status:
		$(KUBE) get all

deploy.apply:
		$(KUBE) apply -k deploy

deploy.replace:
		$(KUBE) replace --force -k deploy

deploy.delete:
		$(KUBE) delete -k deploy

secret.encode:
		kubeseal --format=yaml --cert=config/sealed-secret.crt < deploy/app-secret.yaml > deploy/app-sealed-secret.yaml

secret.decode:
		kubeseal --format=yaml --recovery-unseal --recovery-private-key config/sealed-secret.key -f deploy/app-sealed-secret.yaml > deploy/app-secret.yaml

