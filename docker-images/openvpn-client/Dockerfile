FROM debian:buster-slim
RUN apt-get update && apt-get install -y openvpn iptables
WORKDIR /opt
COPY entrypoint.sh entrypoint.sh
RUN chmod +x entrypoint.sh
ENTRYPOINT [ "./entrypoint.sh" ]
CMD ["openvpn", "/openvpn/ovpn.ovpn"]
