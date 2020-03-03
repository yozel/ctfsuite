FROM kalilinux/kali-rolling:latest
WORKDIR /root
RUN apt-get update && apt-get install -y \
    zsh \
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
    nmap \
    metasploit-framework \
    gobuster \
    binwalk \
    procps

# Customize ZSH
RUN sh -c "$(wget -O- https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)" && \
    git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions && \
    sed -i 's/^\(plugins=.*\))/\1 zsh-autosuggestions)/' ~/.zshrc && \
    echo 'export ZSH_AUTOSUGGEST_USE_ASYNC="TRUE"' >> ~/.zshrc && \
    echo 'ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#858585"' >> ~/.zshrc && \
    chsh -s /usr/bin/zsh && \
    echo 'shell "/usr/bin/zsh"' > /root/.screenrc

# Disable IPV6 for HackTheBox VPN
RUN echo "net.ipv6.conf.all.disable_ipv6 = 0\nnet.ipv6.conf.default.disable_ipv6 = 0\nnet.ipv6.conf.lo.disable_ipv6 = 0" >> /etc/sysctl.conf
COPY entrypoint.sh /usr/bin/

ADD https://raw.githubusercontent.com/v0re/dirb/master/wordlists/common.txt /usr/share/wordlists/dirb/common.txt
COPY tmux.conf /root/.tmux.conf
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
CMD ["zsh"]

