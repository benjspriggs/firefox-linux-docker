# ready-to-go Firefox dev environment
FROM alpine:latest

# add sudo user dev w/ password dev
RUN adduser -S dev -G sys
RUN cat /etc/group
USER dev

# install mecurial
RUN apk add --update hg
# install python, pip, virtualenv
RUN apk add --update \
  python \
  python-dev \
  py-pip \
  build-base \
    && pip install virtualenv \
    && rm -rf /var/cache/apk/*


WORKDIR /home/dev/src
RUN virtualenv /src
ADD https://hg.mozilla.org/mozilla-central/raw-file/default/python/mozboot/bin/bootstrap.py .
RUN python bootstrap.py
