#!/usr/bin/env bash
set -euo pipefail

# Create route to NAT
ip route add 10.10.10.0/24 via 172.28.28.2 dev eth0

exec "$@"

