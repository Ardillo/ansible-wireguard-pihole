# Allow established traffic
iptables -A FORWARD -m conntrack --ctstate RELATED,ESTABLISHED -j ACCEPT
# Allow all traffic from wg0 (VPN) and source subnet
iptables -A FORWARD -i wg0 -s 10.42.42.0/24 -j ACCEPT
# Drop other
iptables -A FORWARD -j DROP
 
# Masquerade traffic from VPN to the internet
iptables -t nat -A POSTROUTING -o ens2 -s 10.42.42.0/24 -j MASQUERADE

# Allow web traffic from and to wg0
iptables -I INPUT -i wg0 -s 10.42.42.0/24 -d 10.42.42.1 -j ACCEPT