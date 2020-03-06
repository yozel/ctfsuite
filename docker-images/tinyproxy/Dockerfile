FROM debian:buster-slim
RUN apt-get update && apt-get install -y iproute2 tinyproxy
WORKDIR /tinyproxy
COPY tinyproxy.conf /tinyproxy/tinyproxy.conf

COPY entrypoint.sh entrypoint.sh
RUN chmod +x entrypoint.sh
ENTRYPOINT [ "./entrypoint.sh" ]
CMD ["tinyproxy", "-d", "-c", "/tinyproxy/tinyproxy.conf"]
