#!/bin/sh
set -x
kubeadm reset --force
yum remove -y kubeadm kubectl kubelet kubernetes-cni kube*
yum autoremove -y
[ -e ~/.kube ] && rm -rf ~/.kube
[ -e /etc/kubernetes ] && rm -rf /etc/kubernetes
[ -e /opt/cni ] && rm -rf /opt/cni

# Scripting to uninstall kubernetes
mkdir -p /opt/data/admin/scripting && \
cat >>/opt/data/admin/scripting/k8s-remove.sh<<EOF
#!/bin/sh
set -x
kubeadm reset --force
# yum remove -y kubeadm kubectl kubelet kubernetes-cni kube*
yum autoremove -y
[ -e ~/.kube ] && rm -rf ~/.kube
[ -e /etc/kubernetes ] && rm -rf /etc/kubernetes
[ -e /opt/cni ] && rm -rf /opt/cni
EOF && \
cd /opt/data/admin/scripting && \
chmod +x k8s-remove.sh && \ 
./k8s-remove.sh