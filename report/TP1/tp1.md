# TP1
## 1 Installation et prise en main
Installation d'ubuntu a l'aide d'un live USB.
## 2 - Découverte de l'environnement réseau
### 1 - Interface réseau
```
enp47s0   Link encap:Ethernet  HWaddr 00:1b:21:60:b5:12  

enp63s0   Link encap:Ethernet  HWaddr 00:24:21:79:b8:ce  
          inet adr:172.24.15.148  Bcast:172.24.127.255  Masque:255.255.128.0

enp7s4    Link encap:Ethernet  HWaddr 00:1b:11:ea:b9:f5  

lo        Link encap:Boucle locale  
          inet adr:127.0.0.1  Masque:255.0.0.0
          adr inet6: ::1/128 Scope:Hôte
```
- `172.24.15.148  Bcast:172.24.127.255  Masque:255.255.128.0` -> @res: 172.24.0.0

- Changer @IP :
`ifconfig enp7s4 198.245.10.0`
- Changer  @MAC :
`ifconfig enp7s4 hw ether 00:11:22:33:44:55`
- Restaurer  @MAC : Changer l'adresse MAC a sont ancien ID
- Désactiver ou activer la carte :
```bash
ifconfig  enp7s4 [down|up]
```
### 2 - État du réseau et connexion
- Ping du DNS de google :
```bash
64 bytes from 8.8.8.8: icmp_seq=56 ttl=41 time=19.1 ms
64 bytes from 8.8.8.8: icmp_seq=57 ttl=41 time=19.1 ms
```

### 4 Résolution des noms de domaine

```bash
leonardinateur@leonard-hdd-toshiba:~$ nslookup www.yahoo.fr
Server:		127.0.1.1
Address:	127.0.1.1#53

Non-authoritative answer:
www.yahoo.fr	canonical name = rc.yahoo.com.
rc.yahoo.com	canonical name = src.g03.yahoodns.net.
Name:	src.g03.yahoodns.net
Address: 212.82.100.150

```

# Assets
- Display internet config :
```bash
ifconfig
```
- Display ip status :
```bash
ip link show
```
- Display route
```bash
route -n
```


```
enp47s0   Link encap:Ethernet  HWaddr 00:1b:21:60:b5:12  
          UP BROADCAST MULTICAST  MTU:1500  Metric:1
          Packets reçus:0 erreurs:0 :0 overruns:0 frame:0
          TX packets:0 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 lg file transmission:1000
          Octets reçus:0 (0.0 B) Octets transmis:0 (0.0 B)
          Interruption:17 Mémoire:f0080000-f00a0000

enp63s0   Link encap:Ethernet  HWaddr 00:24:21:79:b8:ce  
          inet adr:172.24.15.148  Bcast:172.24.127.255  Masque:255.255.128.0
          adr inet6: fe80::ad23:221a:8aa5:1b8f/64 Scope:Lien
          UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
          Packets reçus:45878 erreurs:0 :0 overruns:0 frame:0
          TX packets:19507 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 lg file transmission:1000
          Octets reçus:48141146 (48.1 MB) Octets transmis:1696425 (1.6 MB)
          Interruption:18

enp7s4    Link encap:Ethernet  HWaddr 00:1b:11:ea:b9:f5  
          UP BROADCAST MULTICAST  MTU:1500  Metric:1
          Packets reçus:0 erreurs:0 :0 overruns:0 frame:0
          TX packets:0 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 lg file transmission:1000
          Octets reçus:0 (0.0 B) Octets transmis:0 (0.0 B)

lo        Link encap:Boucle locale  
          inet adr:127.0.0.1  Masque:255.0.0.0
          adr inet6: ::1/128 Scope:Hôte
          UP LOOPBACK RUNNING  MTU:65536  Metric:1
          Packets reçus:1136 erreurs:0 :0 overruns:0 frame:0
          TX packets:1136 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 lg file transmission:1000
          Octets reçus:124853 (124.8 KB) Octets transmis:124853 (124.8 KB)
```
