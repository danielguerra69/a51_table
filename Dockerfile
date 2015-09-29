FROM ubuntu:14.04
# a51 rainbow tables
MAINTAINER Daniel Guerra <daniel.guerra69@gmail.com>

#prequisits

RUN apt-get -y update
RUN apt-get -y upgrade
RUN apt-get -y  install transmission-cli 
WORKDIR /tmp
RUN wget https://opensource.srlabs.de/attachments/download/41/a51_table_torrents.tgz
RUN tar xvfz a51_table_torrents.tgz
RUN find /tmp -name "*.torrent" -exec transmission-cli {} & \;
