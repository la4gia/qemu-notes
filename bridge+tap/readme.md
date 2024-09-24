# Bridge and Tap 2 QEMU VMs

Simple bash script to set up networking settings for two debian guests on a debian host with QEMU. 

### Dependencies Needed (other than qemu)
```
sudo apt install bridge-utils
```
### Run network-builder.sh Script
```
sudo ./network-builder.sh
```
### Run Client VM (update drive file)
```
qemu-system-x86_64 -m 2048 -drive file=/path/to/client.qcow2 -net nic -net tap,ifname=tap-client,script=no,downscript=no -enable-kvm
```
### Run Server VM (update drive file)
```
qemu-system-x86_64 -m 2048 -drive file=/path/to/server.qcow2 -net nic -net tap,ifname=tap-server,script=no,downscript=no -enable-kvm
```
### Configure Interfaces On Both Guests (/etc/network/interfaces)
```
auto ens3
iface ens3 inet static
address 10.10.10.x  <--- UPDATE ME
netmask 255.255.255.0
gateway 10.10.10.1
```
### Reset Networking on Both Guests (or reboot)
```
sudo systemctl restart networking
```
