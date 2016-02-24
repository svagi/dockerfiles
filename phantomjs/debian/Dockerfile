FROM debian:jessie
MAINTAINER Jan Svager <jan@svager.cz>
ENV VERSION=2.1.1 DEBIAN_FRONTEND=noninteractive
RUN apt-get update \
  && apt-get install -y wget ca-certificates fontconfig bzip2 \
  && wget -qO- https://bitbucket.org/ariya/phantomjs/downloads/phantomjs-$VERSION-linux-x86_64.tar.bz2 | tar xvj \
  && cp /phantomjs-*/bin/phantomjs /usr/local/bin/phantomjs \
  && apt-get purge --auto-remove -y wget bzip2 \
  && apt-get clean \
  && rm -rf /phantomjs* /var/lib/apt/lists/*
