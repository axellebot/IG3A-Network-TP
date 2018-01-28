#!/bin/bash
# Author : Axel LE BOT

sudo iptables –F
sudo iptables -P FORWARD ACCEPT
sudo iptables -P INPUT ACCEPT
sudo iptables -P OUTPUT ACCEPT
