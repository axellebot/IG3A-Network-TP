#!bin/bash
sudo systemctl stop NetworkManager
sudo systemctl stop NetworkManager
sudo addr del 192.168.7.2/24 dev enp63s0
sudo ip addr del 192.168.7.2/24 dev enp63s0
sudo ip addr del 172.24.15.151/17 dev enp63s0
sudo killall dhclient
sudo dhclient enp63s0
ip addr show
ping google.fr

