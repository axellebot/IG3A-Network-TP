#!/bin/bash
# Author : Axel LE BOT

sudo iptables -A INPUT -sport 80 -s 192.168.255.0/24 --j accept
sudo iptables -A INPUT -s 216.58.208.206 --j accept
# DNS + google.com
sudo iptables -A INPUT -sport 53 -s 193.50.50.2 --j accept
sudo iptables -A INPUT -sport 53 -s 193.50.50.6 --j accept

sudo iptables -A INPUT -s google.com --j accept

# Don't block client communication
sudo iptables -A FORWARD -sport 80 -s 192.168.255.0/24 --j accept
sudo iptables -A FORWARD -s 216.58.208.206 --j accept
sudo iptables -A FORWARD -sport 53 -s 193.50.50.2 --j accept
sudo iptables -A FORWARD -sport 53 -s 193.50.50.6 --j accept
