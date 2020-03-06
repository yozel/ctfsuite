#!/usr/bin/env bash
set -euo pipefail

# Create NAT GW
iptables --table nat --append POSTROUTING --out-interface tun0 -j MASQUERADE
iptables --append FORWARD --in-interface eth0 -j ACCEPT
iptables -t nat -A PREROUTING -i tun0 -p tcp --dport 7789 -j DNAT --to-destination 172.28.28.4

exec "$@"
