#!/bin/bash
echo "###OS-VERSION###"
cat /etc/os-release  | grep -w "VERSION"
echo "###Kernel version###"
uname -r
echo "###CPU - Virtual cores###"
echo "Threads/core: $(nproc --all)"
echo "###CPU - Clock speed###"
lscpu | grep "CPU MHz:" | awk '{print $3}'
echo "###CPU - Architecture###"
lscpu | grep Architecture | awk '{print $2}'
echo "###RAM###"
free -g
echo "###check network bandwidth on eth0 interface###"
timeout 2 ifstat -t -T -i eth0
echo "###Networking - OS Firewall (Allowed Ports & Protocols)###"
netstat -tulpn | grep LISTEN
echo "###Networking - Network Firewall (Allowed Ports & Protocols)###"
firewall-cmd --list-ports
echo "###Disk - Mounted/Unmounted volumes, type, storage###"
lsblk -fm
