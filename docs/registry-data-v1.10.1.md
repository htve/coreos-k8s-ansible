# run registry
#mkdir -p /data/registry
#docker run -d -p 5000:5000 --network host -v /data/registry:/var/lib/registry --name registry registry
#docker stop registry
#cd /data && tar -czf registry-data-v1.10.1.tgz registry
#tar -xzf registry-data-v1.10.1.tgz


PRIVATE_REG='localhost:5000/k8s'
HYPERKUBE_VER='v1.10.5_coreos.0'
PAUSE_VER='3.1'
KUBE_ROUTER_VER='v0.2.0-beta.10'
BUSYBOX_VER='1.29.2'
COREDNS_VER='1.2.0'
DASHBOARD_VER='v1.8.3'
HEAPSTER_VER='v1.5.3'
ADDON_RESIZER_VER='1.8.1'
HEAPSTER_INFLUXDB_VER='v1.3.3'
HEAPSTER_GRAFANA_VER='v4.4.3'
KEEPALIVED_VER='2.0.6'
HAPROXY_VER='1.8.13'

# hyperkube
docker pull quay.io/coreos/hyperkube:${HYPERKUBE_VER}
docker tag quay.io/coreos/hyperkube:${HYPERKUBE_VER} ${PRIVATE_REG}/hyperkube:${HYPERKUBE_VER%%_*}
docker tag quay.io/coreos/hyperkube:${HYPERKUBE_VER} ${PRIVATE_REG}/hyperkube:latest
docker push ${PRIVATE_REG}/hyperkube:${HYPERKUBE_VER%%_*}
docker push ${PRIVATE_REG}/hyperkube:latest

# pause
docker pull hub.c.163.com/mengkzhaoyun/k8s:pause-${PAUSE_VER}
docker tag hub.c.163.com/mengkzhaoyun/k8s:pause-${PAUSE_VER} ${PRIVATE_REG}/pause:${PAUSE_VER}
docker tag hub.c.163.com/mengkzhaoyun/k8s:pause-${PAUSE_VER} ${PRIVATE_REG}/pause:latest
docker push ${PRIVATE_REG}/pause:${PAUSE_VER}
docker push ${PRIVATE_REG}/pause:latest

# kube-router
docker pull cloudnativelabs/kube-router:${KUBE_ROUTER_VER}
docker tag cloudnativelabs/kube-router:${KUBE_ROUTER_VER} ${PRIVATE_REG}/kube-router:${KUBE_ROUTER_VER}
docker tag cloudnativelabs/kube-router:${KUBE_ROUTER_VER} ${PRIVATE_REG}/kube-router:latest
docker push ${PRIVATE_REG}/kube-router:${KUBE_ROUTER_VER}
docker push ${PRIVATE_REG}/kube-router:latest

# busybox
docker pull library/busybox:${BUSYBOX_VER}
docker tag library/busybox:${BUSYBOX_VER} ${PRIVATE_REG}/busybox:${BUSYBOX_VER}
docker tag library/busybox:${BUSYBOX_VER} ${PRIVATE_REG}/busybox:latest
docker push ${PRIVATE_REG}/busybox:${BUSYBOX_VER}
docker push ${PRIVATE_REG}/busybox:latest

# coredns
docker pull coredns/coredns:${COREDNS_VER}
docker tag coredns/coredns:${COREDNS_VER} ${PRIVATE_REG}/coredns:${COREDNS_VER}
docker tag coredns/coredns:${COREDNS_VER} ${PRIVATE_REG}/coredns:latest
docker push ${PRIVATE_REG}/coredns:${COREDNS_VER}
docker push ${PRIVATE_REG}/coredns:latest

# kubernetes-dashboard-amd64
docker pull hub.c.163.com/mengkzhaoyun/k8s:kubernetes-dashboard-amd64-${DASHBOARD_VER}
docker tag hub.c.163.com/mengkzhaoyun/k8s:kubernetes-dashboard-amd64-${DASHBOARD_VER} ${PRIVATE_REG}/kubernetes-dashboard-amd64:${DASHBOARD_VER}
docker tag hub.c.163.com/mengkzhaoyun/k8s:kubernetes-dashboard-amd64-${DASHBOARD_VER} ${PRIVATE_REG}/kubernetes-dashboard-amd64:latest
docker push ${PRIVATE_REG}/kubernetes-dashboard-amd64:${DASHBOARD_VER}
docker push ${PRIVATE_REG}/kubernetes-dashboard-amd64:latest

# heapster-amd64
docker pull hub.c.163.com/mengkzhaoyun/k8s:heapster-amd64-${HEAPSTER_VER}
docker tag hub.c.163.com/mengkzhaoyun/k8s:heapster-amd64-${HEAPSTER_VER} ${PRIVATE_REG}/heapster-amd64:${HEAPSTER_VER}
docker tag hub.c.163.com/mengkzhaoyun/k8s:heapster-amd64-${HEAPSTER_VER} ${PRIVATE_REG}/heapster-amd64:latest
docker push ${PRIVATE_REG}/heapster-amd64:${HEAPSTER_VER}
docker push ${PRIVATE_REG}/heapster-amd64:latest

# addon-resizer
docker pull hub.c.163.com/mengkzhaoyun/k8s:addon-resizer-${ADDON_RESIZER_VER}
docker tag hub.c.163.com/mengkzhaoyun/k8s:addon-resizer-${ADDON_RESIZER_VER} ${PRIVATE_REG}/addon-resizer:${ADDON_RESIZER_VER}
docker tag hub.c.163.com/mengkzhaoyun/k8s:addon-resizer-${ADDON_RESIZER_VER} ${PRIVATE_REG}/addon-resizer:latest
docker push ${PRIVATE_REG}/addon-resizer:${ADDON_RESIZER_VER}
docker push ${PRIVATE_REG}/addon-resizer:latest

# heapster-influxdb-amd64
docker pull hub.c.163.com/mengkzhaoyun/k8s:heapster-influxdb-amd64-${HEAPSTER_INFLUXDB_VER}
docker tag hub.c.163.com/mengkzhaoyun/k8s:heapster-influxdb-amd64-${HEAPSTER_INFLUXDB_VER} ${PRIVATE_REG}/heapster-influxdb-amd64:${HEAPSTER_INFLUXDB_VER}
docker tag hub.c.163.com/mengkzhaoyun/k8s:heapster-influxdb-amd64-${HEAPSTER_INFLUXDB_VER} ${PRIVATE_REG}/heapster-influxdb-amd64:latest
docker push ${PRIVATE_REG}/heapster-influxdb-amd64:${HEAPSTER_INFLUXDB_VER}
docker push ${PRIVATE_REG}/heapster-influxdb-amd64:latest

# heapster-grafana-amd64
docker pull hub.c.163.com/mengkzhaoyun/k8s:heapster-grafana-amd64-${HEAPSTER_GRAFANA_VER}
docker tag hub.c.163.com/mengkzhaoyun/k8s:heapster-grafana-amd64-${HEAPSTER_GRAFANA_VER} ${PRIVATE_REG}/heapster-grafana-amd64:${HEAPSTER_GRAFANA_VER}
docker tag hub.c.163.com/mengkzhaoyun/k8s:heapster-grafana-amd64-${HEAPSTER_GRAFANA_VER} ${PRIVATE_REG}/heapster-grafana-amd64:latest
docker push ${PRIVATE_REG}/heapster-grafana-amd64:${HEAPSTER_GRAFANA_VER}
docker push ${PRIVATE_REG}/heapster-grafana-amd64:latest

# osixia/keepalived
docker pull osixia/keepalived:${KEEPALIVED_VER}
docker tag osixia/keepalived:${KEEPALIVED_VER} ${PRIVATE_REG}/keepalived:${KEEPALIVED_VER}
docker tag osixia/keepalived:${KEEPALIVED_VER} ${PRIVATE_REG}/keepalived:latest
docker push ${PRIVATE_REG}/keepalived:${KEEPALIVED_VER}
docker push ${PRIVATE_REG}/keepalived:latest

# haproxy
docker pull haproxy:${HAPROXY_VER}
docker tag haproxy:${HAPROXY_VER} ${PRIVATE_REG}/haproxy:${HAPROXY_VER}
docker tag haproxy:${HAPROXY_VER} ${PRIVATE_REG}/haproxy:latest
docker push ${PRIVATE_REG}/haproxy:${HAPROXY_VER}
docker push ${PRIVATE_REG}/haproxy:latest

# heketi
docker pull heketi/heketi:dev
docker tag heketi/heketi:dev ${PRIVATE_REG}/heketi:dev
docker tag heketi/heketi:dev ${PRIVATE_REG}/heketi:latest
docker push ${PRIVATE_REG}/heketi:dev
docker push ${PRIVATE_REG}/heketi:latest

# gluster-centos
docker pull gluster/gluster-centos:latest
docker tag gluster/gluster-centos:latest ${PRIVATE_REG}/gluster-centos:latest
docker push ${PRIVATE_REG}/gluster-centos:latest
