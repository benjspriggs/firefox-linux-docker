# ready-to-go Firefox dev environment
FROM benjspriggs/firefox-linux-deps

LABEL maintainer="ben@sprico.com"

ARG CONTAINER_SHELL=/bin/bash
ENV SHELL $CONTAINER_SHELL

ARG CONTAINER_DISPLAY=:0
ENV DISPLAY $CONTAINER_DISPLAY

CMD ./mach build
