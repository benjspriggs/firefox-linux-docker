# ready-to-go Firefox dev environment
FROM benjspriggs/firefox-linux-deps AS deps

COPY --from=deps . .

LABEL maintainer="ben@sprico.com"

RUN ./mach build
