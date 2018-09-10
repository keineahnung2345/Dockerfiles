# How to install Nvidia-Docker 2.0 on CentOS 7.md

## Update system to the latest packages
```sh
$ yum -y update 
$ yum -y install kernel-devel kernel-headers gcc make
$ yum -y install dkms epel-release
$ shutdown -r now
```
## Disable old Nouveau driver
```sh
$ cat > /etc/modprobe.d/blacklist.conf << EOF
blacklist nouveau
options nouveau modeset=0
EOF
$ mv /boot/initramfs-`uname -r`.img /boot/initramfs-`uname -r`.img.bak
$ wget http://mirror.centos.org/centos/6/os/x86_64/Packages/busybox-1.15.1-21.el6_6.x86_64.rpm
$ rpm -Uvh busybox-1.15.1-21.el6_6.x86_64.rpm
$ yum install --disablerepo=warning:fedora -y ntfs-3g
$ dracut -v /boot/initramfs-`uname -r`.img `uname -r`
```
## Install Nvidia driver
```sh
$ wget http://us.download.nvidia.com/XFree86/Linux-x86_64/390.67/NVIDIA-Linux-x86_64-390.67.run \
-O NVIDIA-Linux-x86_64-390.67.run
$ chmod +x NVIDIA-Linux-x86_64-390.67.run
$ ./NVIDIA-Linux-x86_64-390.67.run
```

To check installation:
```sh
$ nvidia-smi
```

To uninstall:
```sh
$ ./NVIDIA-Linux-x86_64-390.67.run --uninstall
```

## Upgrade docker to docker-ce = 18.03.1.ce
Just follow the instructions here: https://www.vultr.com/docs/installing-docker-ce-on-centos-7

## Install Nvidia-docker 2.0
```sh
$ sudo yum install -y nvidia-docker2
$ sudo pkill -SIGHUP dockerd
```

To check installation:
```sh
$ docker run --runtime=nvidia --rm nvidia/cuda nvidia-smi
```
