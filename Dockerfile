# ready-to-go Firefox dev environment
FROM benjspriggs/docker-stretch-dev
FROM rust

LABEL maintainer="ben@sprico.com"

ENV DEVUSER dev
ENV PASSWD dev
ENV SHELL /bin/sh

ENV MOZILLA_ARCHIVE tip.tar.gz
ENV MOZILLA_CENTRAL https://hg.mozilla.org/mozilla-central/archive/tip.tar.gz 

# install python, pip, virtualenv
RUN apt-get update
RUN apt-get install -y \
      python \
      python-pip \
      libcairo2-dev \
      libpangoft2-1.0-0 \
      libpango1.0-dev \
      unzip \
      zip \
      llvm-3.9 \
      clang-3.9 \
      autoconf \
      autoconf2.13 \
      build-essential \
      libgtk-3-dev \
      libgtk2.0-dev \
      gconf2 \
      && pip install virtualenv

RUN rm -rf /var/cache/apt-get/*

WORKDIR /src

RUN virtualenv .
ADD $MOZILLA_CENTRAL .
RUN tar -xzf $MOZILLA_ARCHIVE && rm $MOZILLA_ARCHIVE
RUN mv mozilla-central-* mozilla-central
RUN ls -la

WORKDIR mozilla-central

RUN ls -la /usr/local
RUN find / -name 'pango'
RUN ./mach build

# switch to development user
USER dev
