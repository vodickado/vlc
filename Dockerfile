FROM ne1ver/vlc-telnet

RUN apk update && \
    apk add --no-cache ca-certificates && \
    update-ca-certificates
