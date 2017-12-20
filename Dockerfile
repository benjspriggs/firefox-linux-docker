# ready-to-go Firefox dev environment
FROM benjspriggs/firefox-linux-deps

LABEL maintainer="ben@sprico.com"

ENV SHELL /bin/bash

RUN ./mach build
ENTRYPOINT ./mach run
