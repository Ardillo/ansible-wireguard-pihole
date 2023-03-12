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
Address = 10.42.42.3/24
DNS = 10.42.42.1

[Peer]
PublicKey = < public key > 
AllowedIPs = 0.0.0.0/0
Endpoint = < public IP : port >
PersistentKeepalive = 20
```