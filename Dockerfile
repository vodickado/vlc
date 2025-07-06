# Base image with GUI and sound support
FROM ubuntu:22.04

# Environment setup
ENV DEBIAN_FRONTEND=noninteractive

# Install VLC and dependencies
RUN apt-get update && \
    apt-get install -y vlc telnet curl && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Set VLC to listen on telnet
ENV VLC_PASSWORD=mysecret

# Expose telnet port
EXPOSE 4212

# Start VLC with Telnet interface
CMD ["cvlc", "--intf", "telnet", "--telnet-password", "mysecret", "--telnet-port", "4212"]
