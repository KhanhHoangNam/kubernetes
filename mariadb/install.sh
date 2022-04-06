kubectl patch deploy --namespace kube-system tiller-deploy -p '{"spec":{"template":{"spec":{"serviceAccount":"tiller"}}}}'
helm repo add bitnami https://charts.bitnami.com/bitnami
helm install my-mariadb bitnami/mariadb --version 10.4.2

helm pull 

https://charts.bitnami.com/bitnami/bitnami/mariadb --version 10.4.2

#1. 
kubectl create -f mariadb-pv-hostpath.yaml 

#2.
kubectl create -f  mariadbslave-pv-hostpath.yaml 

#3. 
kubectl create -f  mariadb-pvc.yaml 

#4.
kubectl create -f  mariadbslave-pvc.yaml 

#5.
helm install --name mariadb --set master.persistence.existingClaim=mariadb-pvc stable/mariadb #Helm 2
helm install mariadb --set master.persistence.existingClaim=mariadb-pvc stable/mariadb #Helm 3
helm install mariadb --set master.persistence.existingClaim=mariadb-master-pvc slave.persistence.existingClaim=mariadb-slave-pvc bitnami/mariadb
helm install mariadb --set primary.persistence.existingClaim=mariadb-master-pvc --set secondary.persistence.existingClaim=mariadb-slave-pvc bitnami/mariadb
#6. Password: gFyTBqHjTz

echo Password: $(kubectl get secret --namespace default mariadb -o jsonpath="{.data.mariadb-root-password}" | base64 --decode)
password: c0sgBCE9Sx; puJzm2E7m2; W2VJovbUI5; Password: ZEmVLXxlyw
mysql -u root -p$MARIADB_ROOT_PASSWORD
mysql -h mariadb.default.svc.cluster.local -uroot -pW2VJovbUI5
mysql -h 10.106.115.209:3306 -uroot -p my_database
mysql -h 192.168.56.11 -u root -p$MARIADB_ROOT_PASSWORD

curl "https://raw.githubusercontent.com/helm/charts/master/stable/mariadb/values.yaml" "values.yaml"

brew install telnet --appdir="~/Applications"
Password de5Xmz68Uc