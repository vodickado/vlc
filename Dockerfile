FROM debian:bookworm

RUN apt update && apt install -y \
    vlc \
    pulseaudio \
    netcat-openbsd \
    telnet \
    && apt clean

CMD cvlc -I dummy \
    --extraintf=http,telnet \
    --http-host 0.0.0.0 \
    --http-port 8080 \
    --http-password 1234 \
    --telnet-host 0.0.0.0 \
    --telnet-port 4212 \
    --telnet-password yourpassword \
    --no-dbus \
    --aout pulse
