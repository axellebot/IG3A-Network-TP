#!/bin/bash

###############################################
# This script configure manually ROUTING + NAT
###############################################

# Disable Network Manager
#systemctl disable NetworkManager
#systemctl stop NetworkManager
#journalctl -e # Display log systemctl

#edit /etc/sysctl.conf (mode router)
## Uncomment the next line to enable packet forwarding for IPv4
#net.ipv4.ip_forward=1

#sudo ifconfig # display physical interface
#sudo ethtool [Interface] # know more infos

IP_NETWORK_INTERFACE="192.168.7.1/24" # My IP on my LAN
IP_NETWORK="192.168.7.0/24" # Ip of my LAN
IP_2="192.168.255.7/24" # My ip on the meshed LAN
INTERFACE_WAN="enp63s0" # University
INTERFACE_1="enp7s4" # My Network
INTERFACE_2="enp47s0" # Switch

# Set IP
ifconfig $INTERFACE_1 $IP_NETWORK_INTERFACE
ifconfig $INTERFACE_2 $IP_2

# ip foward packets
echo "Enabling ip foward" # Logger
echo 1 | sudo tee /proc/sys/net/ipv4/ip_forward

# ROUTING
route add -net 192.168.2.0 netmask 255.255.255.0 gw 192.168.255.2 $INTERFACE_2
route add -net 192.168.3.0 netmask 255.255.255.0 gw 192.168.255.3 $INTERFACE_2
route add -net 192.168.4.0 netmask 255.255.255.0 gw 192.168.255.4 $INTERFACE_2
route add -net 192.168.5.0 netmask 255.255.255.0 gw 192.168.255.5 $INTERFACE_2
route add -net 192.168.6.0 netmask 255.255.255.0 gw 192.168.255.6 $INTERFACE_2
#sudo route add -net 192.168.7.0 netmask 255.255.255.0 gw 192.168.255.7 $INTERFACE_2
route add -net 192.168.10.0 netmask 255.255.255.0 gw 192.168.255.10 $INTERFACE_2

# NAT
#sudo apt-get install linux-image-$(uname -r) # install missing kernel if needed
iptables -t nat -A POSTROUTING -s $IP_NETWORK -o $INTERFACE_WAN -j MASQUERADE
