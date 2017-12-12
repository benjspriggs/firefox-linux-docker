# ready-to-go Firefox dev environment
FROM rust
FROM benjspriggs/docker-stretch-dev

ENV DEVUSER dev
ENV PASSWD dev
ENV SHELL /bin/sh
ENV MOZILLA_ARCHIVE tip.tar.gz
ENV MOZILLA_CENTRAL https://hg.mozilla.org/mozilla-central/archive/tip.tar.gz 

# install python, pip, virtualenv
RUN apt-get install -y \
      sudo \
      python \
      python-dev \
      python-pip \
      && pip install virtualenv

RUN rm -rf /var/cache/apt-get/*


WORKDIR /src

RUN virtualenv .
ADD $MOZILLA_CENTRAL .
RUN tar -xzf $MOZILLA_ARCHIVE && rm $MOZILLA_ARCHIVE
RUN mv mozilla-central-* mozilla-central
RUN ls -la

WORKDIR mozilla-central

RUN ./mach build

# switch to development user
USER dev
