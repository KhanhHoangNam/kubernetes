#Install NFS
1. yum update -y
2. yum install nfs-utils
3. systemctl enable rpcbind
4. systemctl enable nfs-server
5. systemctl enable nfs-lock
6. systemctl enable nfs-idmap
7. systemctl start rpcbind
8. systemctl start nfs-server
9. systemctl start nfs-lock
10. systemctl start nfs-idmap

#Install NFS
yum update -y && \
yum install nfs-utils && \
systemctl enable rpcbind && \
systemctl enable nfs-server && \
systemctl enable nfs-lock && \
systemctl enable nfs-idmap && \
systemctl start rpcbind && \
systemctl start nfs-server&& \
systemctl start nfs-lock && \
systemctl start nfs-idmap 