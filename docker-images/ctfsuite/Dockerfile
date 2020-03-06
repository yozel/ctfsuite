FROM kalilinux/kali-rolling:latest
WORKDIR /root

# Common Tools
RUN apt-get update && apt-get install -y \
    python python3 python-pip python3-pip \
    openssh-client \
    curl \
    git \
    openvpn \
    screen \
    tmux \
    vim \
    net-tools \
    sudo \
    tinyproxy \
    netcat \
    man \
    telnet \
    procps \
    iputils-ping

# TODO: install ipython, requests

COPY tmux.conf /root/.tmux.conf

# Common CTF tools
RUN apt-get update && apt-get install -y \
    metasploit-framework \
    gobuster \
    binwalk \
    nmap

# Common RE Tools
RUN apt-get update && apt-get install -y \
    gdb

# Add common wordlists
RUN mkdir -p /usr/share/wordlists/dirb
RUN wget https://github.com/brannondorsey/naive-hashcat/releases/download/data/rockyou.txt -O /usr/share/wordlists/rockyou.txt
RUN wget https://raw.githubusercontent.com/v0re/dirb/master/wordlists/common.txt -O /usr/share/wordlists/dirb/common.txt

COPY entrypoint.sh entrypoint.sh
RUN chmod +x entrypoint.sh
ENTRYPOINT [ "./entrypoint.sh" ]
CMD ["bash"]
