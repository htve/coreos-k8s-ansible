#!/usr/bin/bash

ETCD="etcd-v3.3.5"
ETCDCTL="etcdctl-v3.3.5"
FLANNEL="flannel-v0.10.0"
KUBECTL="kubectl-v1.10.3"
KUBELET="hyperkube-v1.10.3"
##
mkdir /etc/kubernetes/downloads
cd /etc/kubernetes/downloads
rm -rf *
##
wget $HTTP_SERVER/$ETCD.tgz
tar -xzf $ETCD.tgz
mv etcd-*.aci etcd.aci
rm -rf $ETCD.tgz
##
wget $HTTP_SERVER/$ETCDCTL.tgz
tar -xzf $ETCDCTL.tgz
rm -rf $ETCDCTL.tgz
mv etcdctl-* etcdctl
chmod 0744 etcdctl
##
wget $HTTP_SERVER/$FLANNEL.tgz
tar -xzf $FLANNEL.tgz
mv flannel-*.aci flannel.aci
rm -rf $FLANNEL.tgz
##
wget $HTTP_SERVER/$KUBECTL.tgz
tar -xzf $KUBECTL.tgz
rm -rf $KUBECTL.tgz
mv kubectl-* kubectl
chmod 0744 kubectl
ln -s /etc/kubernetes/downloads/kubectl /opt/bin/kubectl
##
wget $HTTP_SERVER/$KUBELET.tgz
tar -xzf $KUBELET.tgz
mv hyperkube-*.aci hyperkube.aci
rm -rf $KUBELET.tgz