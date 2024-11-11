#!/bin/bash

set -e

echo "Apply environments variables."
source /etc/profile
echo "source /etc/profile" >> ~/.bashrc

echo "Creating directories."
mkdir -p /var/{log,opt}/{postgresql,minio,redis,registry,gitaly,gitlab-shell,nats,casdoor,nginx,space-builder} 2>/dev/null
mkdir -p /var/run/{postgresql,redis} 2>/dev/null
mkdir -p /var/nginx/client_body_temp 2>/dev/null
mkdir -p /var/log/{csghub-server,csghub-accounting,csghub-runner,csghub-user,csghub-rproxy,csghub-portal,mirror-lfs,mirror-repo,dnsmasq} 2>/dev/null
chown -R postgres:postgres /var/{opt,log,run}/postgresql
chown -R redis:redis /var/{opt,log,run}/redis
chown -R registry:registry /var/{opt,log}/registry /etc/registry
chown -R minio:minio /var/{opt,log}/minio
chown -R git:git /var/{opt,log}/gitaly /etc/gitaly
chown -R nats:nats /var/{opt,log}/nats /etc/nats

# Create link for fixed space-builder using script directory
ln -sf /scripts /script

# Create postgresql links
find /usr/lib/postgresql/*/bin/ -maxdepth 1 -type f -executable -exec ln -s {} /usr/bin \; 2>/dev/null

# Start supervisor
/usr/bin/supervisord -c /etc/supervisord.conf