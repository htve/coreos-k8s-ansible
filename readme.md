# Deploy

# How to Create Install Datas
## 1.10.1
BAIDU DISK <br>
Link：https://pan.baidu.com/s/1wYXc0QfNm7GapiLbGJSs-Q <br>
Pass：z6g9
# Prepare

## 1). Config
Modify CoreOS config<br>
./start

Modify Machine Name&IP<br>
./ansible/hosts

Modify k8s Cluster Config<br>
./ansible/coreos/group_vars/*

## 2). HTTP_SERVER
http://192.168.3.20/k8s<br>
Check the server contains [download-data](./docs/download-data-v1.10.1.md) files：

```bash
ActivePython-2.7.13.2714-linux-x86_64-glibc-2.12-402178.tar.gz
cni-plugins-amd64-v0.7.1.tgz
ct-v0.7.0-x86_64-unknown-linux-gnu
etcdctl-v3.3.3.tgz
etcd-v3.3.3.tgz
flannel-v0.10.0.tgz
hyperkube-v1.10.1.tgz
kubectl-v1.10.1.tgz
pypy2-v5.10.0-linux64.tar.bz2
rkt-prepare.sh
```

## 3). Local registry
Check registry contains [registry-data](./docs/registry-data-v1.10.1.md) images

```bash
# core registry-data to /tmp and unzip
tar -xzf registry-data-v1.10.1.tgz

# run 
docker run -d -p 5000:5000 --network host -v /tmp/registry:/var/lib/registry --name registry registry
```

## 4). CoreOS images
http://192.168.3.20/1688.5.3<br>
Check the server contains these files：
```bash
coreos_production_image.bin.bz2
coreos_production_image.bin.bz2.sig
coreos_production_iso_image
```
Download link: https://stable.release.core-os.net/amd64-usr/1688.5.3/

# Install
## 1). install coreos to each node
```cmd
#Chang minimal.yaml and ct to <node>.json
.\ct.exe --in-file minimal.yaml --out-file <node>.json --pretty --strict

#Upload minimal.json to http server
http://192.168.3.20/<node>.json

#Use CoreOS image to boot

#Set ip
sudo ifconfig eno1 192.168.2.111/21

#Download start script
wget 192.168.3.20/start

#Modify permissions
chmod +x start

#Run
./start <node>
```

## 2).run ansible from docker
```bash
docker run --name ansible -h ansible -v /tmp/core:/etc/ansible -d hub.c.163.com/mengkzhaoyun/public:ansible-2.3.0-centos7 /bin/sh -c "while true; do echo hello world; sleep 1; done"
```

## 3).enter in ansible cotainer
```bash
# enter contianer run ansible scripts
docker exec -it ansible bash
# installation necessary
rpm -i sshpass-*

# exec commands to install k8s 
cd coreos
ap a.bootstrap.yml
ap b.install.yml
ap c.test.yml
ap d.addon.yml
```