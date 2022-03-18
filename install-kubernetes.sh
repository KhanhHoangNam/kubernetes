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
