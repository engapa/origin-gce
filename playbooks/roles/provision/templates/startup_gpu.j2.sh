#!/bin/bash
rpm -ivh --nodeps https://github.com/NVIDIA/nvidia-docker/releases/download/v1.0.0/nvidia-docker-1.0.0-1.x86_64.rpm
cat > /etc/yum.repos.d/nvidia.repo << EOF
[NVIDIA]
name=NVIDIA
baseurl=http://developer.download.nvidia.com/compute/cuda/repos/rhel7/x86_64/
failovermethod=priority
enabled=1
gpgcheck=0
EOF
yum -y install xorg-x11-drv-nvidia xorg-x11-drv-nvidia-devel
modprobe -r nouveau
nvidia-modprobe
systemctl restart nvidia-docker