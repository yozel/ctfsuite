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
ADD https://github.com/brannondorsey/naive-hashcat/releases/download/data/rockyou.txt /usr/share/wordlists/rockyou.txt
ADD https://raw.githubusercontent.com/v0re/dirb/master/wordlists/common.txt /usr/share/wordlists/dirb/common.txt

CMD ["bash"]
