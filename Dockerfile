# ready-to-go Firefox dev environment
FROM benjspriggs/firefox-linux-deps

LABEL maintainer="ben@sprico.com"

ARG CONTAINER_SHELL=/bin/bash
ENV SHELL $CONTAINER_SHELL

ARG X11_DOCK=/tmp/.X11-unix
VOLUME $X11_DOCK

ARG CONTAINER_DISPLAY=:0
ENV DISPLAY $CONTAINER_DISPLAY

RUN ./mach build
ENTRYPOINT ./mach run
