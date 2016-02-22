FROM debian:jessie
MAINTAINER Jan Svager <jan@svager.cz>
RUN apt-get update \
 && apt-get --no-install-recommends install -y \
  texlive-xetex \
  texlive-fonts-recommended \
  lmodern \
 && rm -rf /var/lib/apt/lists/*
