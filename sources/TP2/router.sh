#!/bin/bash
###############################################
# This script configure manually ROUTING + NAT
###############################################
# Disable NetworkManager before

# Edit /etc/sysctl.conf (mode router)

# Uncomment the next line to enable packet forwarding for IPv4
#net.ipv4.ip_forward=1

NETWORK_IP_MY_LAN="192.168.7.0/24" # IP of my LAN
IP_MY_LAN_INTERFACE="192.168.7.1/24" # My IP on my LAN
IP_MESHED_LAN="192.168.255.7/24" # My IP on the meshed LAN
INTERFACE_WAN="enp63s0" # University Network
INTERFACE_MY_LAN="enp7s4" # My Network
INTERFACE_MESHED_LAN="enp47s0" # Switch

# Set IP
echo "Setting ip on inteface ..." # Logger
ifconfig $INTERFACE_MY_LAN $IP_MY_LAN_INTERFACE
ifconfig $INTERFACE_MESHED_LAN $IP_MESHED_LAN

# ip foward packets
echo "Enabling ip foward ..." # Logger
echo 1 | sudo tee /proc/sys/net/ipv4/ip_forward

# ROUTING
echo "Adding routes ..." # Logger
route add -net 192.168.2.0 netmask 255.255.255.0 gw 192.168.255.2 $INTERFACE_MESHED_LAN
route add -net 192.168.3.0 netmask 255.255.255.0 gw 192.168.255.3 $INTERFACE_MESHED_LAN
route add -net 192.168.4.0 netmask 255.255.255.0 gw 192.168.255.4 $INTERFACE_MESHED_LAN
route add -net 192.168.5.0 netmask 255.255.255.0 gw 192.168.255.5 $INTERFACE_MESHED_LAN
route add -net 192.168.6.0 netmask 255.255.255.0 gw 192.168.255.6 $INTERFACE_MESHED_LAN
#route add -net 192.168.7.0 netmask 255.255.255.0 gw 192.168.255.7 $INTERFACE_MESHED_LAN
route add -net 192.168.10.0 netmask 255.255.255.0 gw 192.168.255.10 $INTERFACE_MESHED_LAN

# NAT
#apt install linux-image-$(uname -r) # install missing kernel if needed
echo "Setting NAT ..." # Logger
iptables -t nat -A POSTROUTING -s $NETWORK_IP_MY_LAN -o $INTERFACE_WAN -j MASQUERADE
