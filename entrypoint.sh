#!/usr/bin/env bash
set -euo pipefail
IFS=$'\n\t'
(sysctl -p > /dev/null && echo "[#] sysctl -p is OK") || echo "[!] sysctl -p is FAILED. You may want to use docker run --privileged ..."
ln -s /host/.zsh_history /root/.zsh_history
exec "$@"
