# Wireguard + Pi-Hole

Needed pre-reqs
```
ansible-galaxy collection install community.docker
```

Generate a wireguard key
```
wg genkey > peer.key
chmod go-r peer.key
wg pubkey < peer.key > peer.pub
```

Skeleton client config
```
[Interface]
PrivateKey = < private key >
Address = 10.42.42.2/24
DNS = 10.42.42.1

[Peer]
PublicKey = < public key > 
AllowedIPs = 0.0.0.0/0
Endpoint = < public IP : port >
PersistentKeepalive = 20
```

Generate QR code
```
qrencode -t ansiutf8 < wg.conf
```

In order to connect to the Pi-Hole Webinterface I use a SSH tunnel
```
ssh -i ~/.ssh/mykey -L 8080:localhost:80 root@< ip >
```


## NOTE

Some helpful debugging with logging iptables lines
```
iptables -I FORWARD 7 -m limit --limit 2/min -j LOG --log-level 7 --log-prefix '#iptables-masq'
```

## TODO

Add blacklist
```
https://codeberg.org/spootle/blocklist/raw/branch/master/blocklist.txt spootle blocklist
```

A List of pegasus domains
```
(\.|^)free247downloads\.com$
(\.|^)urlpush\.net$
(\.|^)documentpro\.org$
(\.|^)tahmilmilafate\.com$
(\.|^)tahmilmilafate\.info$
(\.|^)baramije\.net$
```

List of configures Clients

List of local DNS domains

## References

- https://github.com/shaderecker/ansible-pihole/tree/master/roles
- https://hub.docker.com/r/pihole/pihole
- https://github.com/pi-hole/docker-pi-hole#note-on-capabilities
- https://docs.pi-hole.net/ftldns/configfile/