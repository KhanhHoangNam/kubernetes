#!/bin/bash
#Updated @since 20220315

#Init kubernetes cluster
kubeadm init --apiserver-advertise-address=192.168.56.10 --pod-network-cidr=10.244.0.0/16

#Add config
sudo cp /etc/kubernetes/admin.conf $HOME/
sudo chown $(id -u):$(id -g) $HOME/admin.conf
export KUBECONFIG=$HOME/admin.conf

# Apply plugin network
kubectl apply -f https://github.com/coreos/flannel/raw/master/Documentation/kube-flannel.yml

#In this fail case
kubectl create -f https://raw.githubusercontent.com/coreos/flannel/master/Documentation/kube-flannel-rbac.yml

#Join worker-node
kubeadm join 192.168.56.10:6443 --token aci5or.xb7w9lme5skijjsg --discovery-token-ca-cert-hash sha256:0fdd4aacd376e5f327f558946b87d25b954d4ac5fb23a32f528c7da5b86e3f74
kubeadm join 192.168.56.10:6443 --token lis9do.ur16ck2d8gnipdx8 --discovery-token-ca-cert-hash sha256:60ceb3f49885533f73f993935f359592d5b5a6720d77652fd84eb70ce410038e 

#Install couch base
#Add repo
helm repo add couchbase https://couchbase-partners.github.io/helm-charts/

#Finish by updating the repository index:
helm repo update

#Install the Couchbase Helm Chart
helm install couchbase couchbase/couchbase-operator

#Copy from vm to host
scp -i ~/.ssh/namhgssh.crash root@165.22.62.165:/root/.kube/config ~/.kube/config-anothercluser

#Install mariadb
$ helm repo add bitnami https://charts.bitnami.com/bitnami
$ helm install mariadb bitnami/mariadb

Tip:

  Watch the deployment status using the command: kubectl get pods -w --namespace default -l app.kubernetes.io/instance=mariadb

Services:

  echo Primary: mariadb.default.svc.cluster.local:3306

Administrator credentials:

  Username: root
  Password : ToARMZ2HgY $(kubectl get secret --namespace default mariadb -o jsonpath="{.data.mariadb-root-password}" | base64 --decode)

To connect to your database:

  1. Run a pod that you can use as a client:

      kubectl run mariadb-client --rm --tty -i --restart='Never' --image  docker.io/bitnami/mariadb:10.5.15-debian-10-r30 --namespace default --command -- bash

  2. To connect to primary service (read/write):

      mysql -h mariadb.default.svc.cluster.local -uroot -p my_database

To upgrade this helm chart:

  1. Obtain the password as described on the 'Administrator credentials' section and set the 'auth.rootPassword' parameter as shown below:

      ROOT_PASSWORD=$(kubectl get secret --namespace default mariadb -o jsonpath="{.data.mariadb-root-password}" | base64 --decode)
      helm upgrade --namespace default mariadb bitnami/mariadb --set auth.rootPassword=$ROOT_PASSWORD


      user: root
      password: ToARMZ2HgY
      url: http://mariadb.default.svc.cluster.local:3306

brew install --appdir="/Applications" vagrant