# ready-to-go Firefox dev environment
FROM benjspriggs/firefox-linux-deps

LABEL maintainer="ben@sprico.com"

RUN ./mach build
