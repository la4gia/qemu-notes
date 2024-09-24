#!/bin/bash

# Create the bridge br0
sudo brctl addbr br0
sudo ip addr add 10.10.10.1/24 dev br0  # Assign an IP to the bridge 

# Create TAP devices
sudo ip tuntap add dev tap-client mode tap
sudo ip tuntap add dev tap-server mode tap

# Attach TAP devices to the bridge
sudo brctl addif br0 tap-client
sudo brctl addif br0 tap-server

# Bring TAP devices up
sudo ip link set tap-client up
sudo ip link set tap-server up

# Bring the bridge up
sudo ip link set br0 up

# Check the status of bridge and TAP interfaces
sudo ip link show br0
sudo ip link show tap-client
sudo ip link show tap-server
