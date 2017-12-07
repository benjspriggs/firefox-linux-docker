# ready-to-go Firefox dev environment
FROM alpine:latest

ENV DEVUSER dev
ENV PASSWD dev
ENV MOZILLA_CENTRAL mozilla-central
# ENV MOZILLA_ARCHIVE $MOZILLA_CENTRAL
# ENV MOZILLA_CENTRAL https://hg.mozilla.org/mozilla-central/archive/tip.tar.gz 

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
    && pip install virtualenv \
    && rm -rf /var/cache/apk/*


WORKDIR /src

RUN virtualenv .
# TODO : change to use downloaded archive
COPY $MOZILLA_CENTRAL .
# TODO: uncomment to use downloaded archive instead of
# local one
# RUN tar -xzf $MOZILLA_ARCHIVE && rm $MOZILLA_ARCHIVE
# RUN mv mozilla-central-* mozilla-central
# RUN ls -la

WORKDIR mozilla-central

RUN adduser $DEVUSER -D
# add dev to sudoers
RUN adduser $DEVUSER sudo
RUN chpasswd $DEVUSER:$PASSWD
USER $DEVUSER
