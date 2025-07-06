FROM debian:bullseye

RUN apt-get update && \
    apt-get install -y --no-install-recommends vlc ca-certificates && \
    update-ca-certificates && \
    rm -rf /var/lib/apt/lists/*

CMD ["vlc", "--extraintf", "telnet", "--telnet-password", "admin"]
