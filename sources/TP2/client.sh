#!/bin/bash
###############################################
# Set IP and default gateway
###############################################
# Disable NetworkManager before

# Set Manual IP
ifconfig enp47s0 192.168.7.2 netmask 255.255.255.0

# Edit default route
route add default gw 192.168.7.1 enp47s0
