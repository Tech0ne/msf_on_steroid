FROM ubuntu:22.04

WORKDIR /root/

COPY bashrc /root/bashrc

RUN cat bashrc >> .bashrc
RUN rm bashrc

RUN apt-get update
RUN apt-get install -y curl gnupg wget iproute2 systemctl
RUN echo 'deb http://apt.metasploit.com/ lucid main' > /etc/apt/sources.list.d/metasploit-framework.list
RUN curl http://apt.metasploit.com/metasploit-framework.gpg.key | apt-key add -
RUN apt-get update
RUN apt-get -y install metasploit-framework

RUN curl https://sliver.sh/install | bash

RUN curl https://raw.githubusercontent.com/g0tmi1k/msfpc/master/msfpc.sh > /usr/bin/msfpc
RUN chmod +x /bin/msfpc
