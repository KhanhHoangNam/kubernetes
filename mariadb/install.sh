kubectl patch deploy --namespace kube-system tiller-deploy -p '{"spec":{"template":{"spec":{"serviceAccount":"tiller"}}}}'
helm repo add bitnami https://charts.bitnami.com/bitnami
helm install my-mariadb bitnami/mariadb --version 10.4.2

helm pull 

https://charts.bitnami.com/bitnami/bitnami/mariadb --version 10.4.2