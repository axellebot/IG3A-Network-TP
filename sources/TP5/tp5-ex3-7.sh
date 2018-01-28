# Netfilter/IPtables - example of multiple-port knocking
# Note: Knock ports 100,200,300,400 to open SSH port for 5 seconds.
# Nice thing to knock TCP with is `telnet' program:
# $> alias k='telnet ip_address_or_hostname'
# $> k 100 ; k 200 ; k 300 ; k 400 ; ssh ip_address_or_hostname
# Then press Ctrl-C 4 times. That's all. Enjoy.

HOST_IP="12.34.56.78"

/sbin/iptables -N INTO-PHASE2
/sbin/iptables -A INTO-PHASE2 -m recent --name PHASE1 --remove
/sbin/iptables -A INTO-PHASE2 -m recent --name PHASE2 --set
/sbin/iptables -A INTO-PHASE2 -j LOG --log-prefix "INTO PHASE2: "

/sbin/iptables -N INTO-PHASE3
/sbin/iptables -A INTO-PHASE3 -m recent --name PHASE2 --remove
/sbin/iptables -A INTO-PHASE3 -m recent --name PHASE3 --set
/sbin/iptables -A INTO-PHASE3 -j LOG --log-prefix "INTO PHASE3: "

/sbin/iptables -N INTO-PHASE4
/sbin/iptables -A INTO-PHASE4 -m recent --name PHASE3 --remove
/sbin/iptables -A INTO-PHASE4 -m recent --name PHASE4 --set
/sbin/iptables -A INTO-PHASE4 -j LOG --log-prefix "INTO PHASE4: "

/sbin/iptables -A INPUT -m recent --update --name PHASE1

/sbin/iptables -A INPUT -p tcp --dport 100 -m recent --set --name PHASE1
/sbin/iptables -A INPUT -p tcp --dport 200 -m recent --rcheck --name PHASE1 -j INTO-PHASE2
/sbin/iptables -A INPUT -p tcp --dport 300 -m recent --rcheck --name PHASE2 -j INTO-PHASE3
/sbin/iptables -A INPUT -p tcp --dport 400 -m recent --rcheck --name PHASE3 -j INTO-PHASE4

/sbin/iptables -A INPUT -p tcp -s $HOST_IP --dport 22 -m recent --rcheck --seconds 5 --name PHASE4 -j ACCEPT
