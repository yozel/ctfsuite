FROM debian:buster-slim
RUN apt-get update && apt-get install -y tinyproxy
WORKDIR /tinyproxy
COPY tinyproxy.conf /tinyproxy/tinyproxy.conf
CMD ["tinyproxy", "-d", "-c", "/tinyproxy/tinyproxy.conf"]
