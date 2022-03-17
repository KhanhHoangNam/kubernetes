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
kubeadm join 192.168.56.10:6443 --token xd1jbf.0oi6c5x5y1wkn54l --discovery-token-ca-cert-hash sha256:3d4ca66bb10e235f73e917c1b44920d6c608ed4c4599d6869686cad4582d3001 
