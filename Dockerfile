FROM ubuntu:12.04
MAINTAINER Frank Macreery <frank@macreery.com>

ADD files/usr/bin/apt-install /usr/bin/apt-install

# Install Git
RUN apt-install git

# Install latest security updates now, and on build
RUN grep security /etc/apt/sources.list > /tmp/security.list
RUN apt-get -o Dir::Etc::SourceList=/tmp/security.list update \
 && apt-get -o Dir::Etc::SourceList=/tmp/security.list upgrade -y \
 && rm -rf /var/lib/apt/lists/*
ONBUILD RUN apt-get -o Dir::Etc::SourceList=/tmp/security.list update \
         && apt-get -o Dir::Etc::SourceList=/tmp/security.list upgrade -y \
         && rm -rf /var/lib/apt/lists/*

# Install Bats
RUN git clone https://github.com/sstephenson/bats.git /tmp/bats && \
    cd /tmp/bats && ./install.sh /usr/local

# Integration tests
ADD test /tmp/test
RUN bats /tmp/test
