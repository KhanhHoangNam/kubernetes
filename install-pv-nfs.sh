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