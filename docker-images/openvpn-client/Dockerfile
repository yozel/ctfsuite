FROM debian:buster-slim
RUN apt-get update && apt-get install -y openvpn
WORKDIR /openvpn
CMD ["openvpn", "/openvpn/ovpn.ovpn"]
