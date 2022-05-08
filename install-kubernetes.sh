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
kubeadm join 192.168.56.10:6443 --token a4wyqq.6vhdj9dmdtfw0zcp --discovery-token-ca-cert-hash sha256:110376352386c321074a092e94c133a28107fcbf9f9e5a386825c38f8bce4e3c

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
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
curl -O https://raw.githubusercontent.com/MartinSeeler/iterm2-material-design/master/material-design-colors.itermcolors
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting

brew install helm --appdir="~/Applications"
helm pull bitnami/mariadb --version 10.4.5 --untar
helm repo add couchbase https://couchbase-partners.github.io/helm-charts/
helm pull couchbase/couchbase-operator


rsync ~/Downloads/speed -i "nathan-key.pem" ec2-user@3.0.17.175:/home/ec2-user
scp -i "nathan-key.pem" Speed.zip ec2-user@ec2-3-0-17-175.ap-southeast-1.compute.amazonaws.com:/home/ec2-user
docker run -d --restart=unless-stopped --privileged -p 80:80 -p 443:443 -v /opt/rancher:/var/lib/rancher rancher/rancher:latest

helm pull sentry/sentry --version 14.0.2 --untar

sudo docker run -d --restart=unless-stopped -p 80:80 -p 443:443 --privileged -v /opt/rancher:/var/lib/rancher rancher/rancher:latest
sudo docker run -d --restart=unless-stopped -p 80:80 -p 443:443 --privileged -v /opt/rancher:/var/lib/rancher-data rancher/rancher:stable

docker logs  container-id  2>&1 | grep "Bootstrap Password:"
docker logs  hopeful_borg  2>&1 | grep "Bootstrap Password:"

192.168.56.10

fsmml48c9zctjn49gs9bp4sgfv7w2ft6tfpxvxnhtdj2967d4stt5m

scp root@192.168.56.10:/etc/kubernetes/admin.conf ~/.kube/config-cluster
scp -i ~/Downloads/keypairssh.crash root@165.22.62.165:/root/rancher-deployment.yaml ~/Documents/worksapce/kubernetes/rancher
export KUBECONFIG=~/.kube/config:~/.kube/config-cluster

172.17.0.2

curl --insecure -sfL https://165.22.62.165/v3/import/s7n4g24t8j9m4zmnzcmrvscd8ndspxf85t89fwdgqxrd5dp2g2x6xr_c-m-vn8x6rcd.yaml

docker logs  gifted_borg  2>&1 | grep "Bootstrap Password:" xr5742xgjlbf6pnx5rf796xdxh6t528mcwwj4jlbdmdxbm6djchz66
