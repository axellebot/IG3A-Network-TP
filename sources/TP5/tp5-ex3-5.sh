-A INPUT -p tcp -m tcp --dport 22 -j LOGDROP
# Applique la police LOGDROP aux paquets TCP à destination du port 22.
-A INPUT -p tcp -m tcp --dport 3389 -j DROP
# Applique la police DROP aux paquets TCP à destination du port 3389.
-A LGRDP -p tcp -m limit --limit 5/min -j LOG --log-prefix "Denied RDP : " --log-level 7
# S'il y a plus de 5 paquets TCP par minute, on enregistre l'essai en notant avant "Denied RDP : "
-A LGRDP -j drop
# Sinon on drop
-A LOGDROP -p tcp -m tcp --dport 22 -m state --state NEW -m recent --set --name SSH --rsource
-A LOGDROP -p tcp -m tcp --dport 22 -m state --state NEW -m recent --update -- seconds 60 --hitcount4 --name SSH --rsource -j LOG --log-prefix "SSH SCAN blocked:" --log-level 6
-A LOGDROP -p tcp -m tcp --dport 22 -m state --state NEW -m recent --seconds 60 --hitcount 4 --name SSH --rsource -j DROP
-A LOGDROP -p tcp -m tcp --dport 22 -m state --state NEW -j ACCEPT
COMMIT
# Completed on Wed Jun 9 14:27:04 2010
