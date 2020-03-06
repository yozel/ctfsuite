FROM debian:buster-slim
RUN apt-get update && apt-get install -y openvpn iptables
WORKDIR /opt
COPY *.sh ./
RUN chmod +x *.sh
ENTRYPOINT [ "./entrypoint.sh" ]
CMD ["openvpn", "/openvpn/ovpn.ovpn"]
