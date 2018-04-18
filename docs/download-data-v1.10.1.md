
#https://storage.googleapis.com/kubernetes-release/release/stable.txt

ETCD_VER=v3.3.3
CNI_VER=v0.7.1
CT_VER=v0.7.0
FLANNEL_VER=v0.10.0
HYPERKUBE_VER=v1.10.1_coreos.0
KEBECTL_VER=v1.10.1  

# etcd
rkt fetch quay.io/coreos/etcd:${ETCD_VER}
rkt image export quay.io/coreos/etcd:${ETCD_VER} etcd-${ETCD_VER}.aci
tar -czf etcd-${ETCD_VER}.tgz etcd-${ETCD_VER}.aci

# etcdctl
wget https://github.com/coreos/etcd/releases/download/${ETCD_VER}/etcd-${ETCD_VER}-linux-amd64.tar.gz
tar -xzf etcd-${ETCD_VER}-linux-amd64.tar.gz && rm -rf etcd-${ETCD_VER}-linux-amd64.tar.gz
mv etcd-${ETCD_VER}-linux-amd64/etcdctl etcdctl-${ETCD_VER}-linux-amd64 && rm -rf etcd-${ETCD_VER}-linux-amd64
tar -czf etcdctl-${ETCD_VER}.tgz etcdctl-${ETCD_VER}-linux-amd64 && rm -rf etcdctl-${ETCD_VER}-linux-amd64

# cni-plugins
wget https://github.com/containernetworking/plugins/releases/download/${CNI_VER}/cni-plugins-amd64-${CNI_VER}.tgz

# ct
wget https://github.com/coreos/container-linux-config-transpiler/releases/download/${CT_VER}/ct-${CT_VER}-x86_64-unknown-linux-gnu

# ActivePython
wget http://downloads.activestate.com/ActivePython/releases/2.7.13.2714/ActivePython-2.7.13.2714-linux-x86_64-glibc-2.12-402178.tar.gz

# flannel
rkt fetch quay.io/coreos/flannel:${FLANNEL_VER}
rkt image export quay.io/coreos/flannel:${FLANNEL_VER} flannel-${FLANNEL_VER}.aci
tar -czf flannel-${FLANNEL_VER}.tgz flannel-${FLANNEL_VER}.aci

# hyperkube
rkt fetch quay.io/coreos/hyperkube:${HYPERKUBE_VER}
rkt image export quay.io/coreos/hyperkube:${HYPERKUBE_VER} hyperkube-${HYPERKUBE_VER%%_*}.aci
tar -czf hyperkube-${HYPERKUBE_VER%%_*}.tgz hyperkube-${HYPERKUBE_VER%%_*}.aci

# kubectl
wget https://storage.googleapis.com/kubernetes-release/release/${KEBECTL_VER}/bin/linux/amd64/kubectl
mv kubectl kubectl-${KEBECTL_VER}
tar -czf kubectl-${KEBECTL_VER}.tgz kubectl-${KEBECTL_VER}

# pypy
wget https://bitbucket.org/pypy/pypy/downloads/pypy2-v5.10.0-linux64.tar.bz2