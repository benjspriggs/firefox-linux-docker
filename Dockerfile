# ready-to-go Firefox dev environment
FROM corey/rust-alpine:latest

ENV DEVUSER dev
ENV PASSWD dev
ENV SHELL /bin/sh
ENV MOZILLA_ARCHIVE tip.tar.gz
ENV MOZILLA_CENTRAL https://hg.mozilla.org/mozilla-central/archive/tip.tar.gz 

# install mecurial
RUN apk add --update mercurial
# install python, pip, virtualenv
RUN apk add --update \
      sudo \
      mercurial \
      python \
      python-dev \
      py-pip \
      build-base \
      && pip install virtualenv

RUN rm -rf /var/cache/apk/*


WORKDIR /src

RUN virtualenv .
ADD $MOZILLA_CENTRAL .
RUN tar -xzf $MOZILLA_ARCHIVE && rm $MOZILLA_ARCHIVE
RUN mv mozilla-central-* mozilla-central
RUN ls -la

WORKDIR mozilla-central

RUN adduser $DEVUSER -D -s $SHELL
RUN echo $DEVUSER:$PASSWD | chpasswd
# add dev to sudoers
RUN echo 'dev ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers
RUN ./mach build

USER dev
