FROM ubuntu:14.04
# a51 rainbow tables
MAINTAINER Daniel Guerra <daniel.guerra69@gmail.com>

#prequisits

RUN apt-get -y update
RUN apt-get -y upgrade
RUN apt-get -y  install transmission-cli wget
WORKDIR /tmp
RUN echo "#!/bin/sh " > /tmp/killtransmission.sh
RUN echo "killall transmission-cli" >> /tmp/killtransmission.sh
RUN chmod a+x killtransmission.sh
RUN wget https://opensource.srlabs.de/attachments/download/41/a51_table_torrents.tgz
RUN tar xvfz a51_table_torrents.tgz
RUN find /tmp -name "*.torrent" -exec transmission-cli -f /tmp/killtransmission.sh {} \;
