# CTF Suite
This repo contains 3 images and an orchestrator docker-compose.yaml.

## Using

1- Place your Hack The Box `****.ovpn` file to hackthebox.ovpn
2- Run docker compose with `docker-compose up --build --abort-on-container-exit` (DO NOT CLOSE THIS PROCESS)

Now you can connect to bash shell with `docker-compose exec ctfsuite bash`. You can also use port 3301 for http proxy. You will probably want to add this proxy to your Burp Suite. Also, for reverse shell from `A Box` to `CTF Suite Shell` you can use port `7790`. Just listen it with `nc -l -p 7789`.


