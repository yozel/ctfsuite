#!/usr/bin/env bash
set -euo pipefail

while true; do
    openvpn_container=$(docker-compose ps | grep kali-yozel_openvpn-hackthebox | grep Up | awk '{print $1}')
    if [ "$openvpn_container" != "" ]; then
        ip=$(docker exec -it $openvpn_container "./show_htb_ip.sh" | sed "s/$(printf '\015')//g" )
        if [ "$ip" != "" ]; then
            break
        fi
    fi
    sleep 1
done

echo "==========================================="
echo "==========================================="
echo
echo "          Reverse Shell Command"
echo "       nc -l -p ${ip} 7789"
echo
echo "==========================================="
echo "==========================================="
echo

exec docker-compose exec -e HTBIP="$ip" ctfsuite bash
