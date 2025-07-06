FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive
ENV VLC_PASSWORD=mysecret

# Install VLC and dependencies
RUN apt-get update && \
    apt-get install -y vlc telnet curl sudo && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Create a non-root user
RUN useradd -m -s /bin/bash vlcuser && \
    echo "vlcuser ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

# Switch to non-root user
USER vlcuser
WORKDIR /home/vlcuser

# Expose telnet control port
EXPOSE 4212

# Command to run VLC with telnet interface
CMD ["cvlc", "--intf", "telnet", "--telnet-password", "mysecret", "--telnet-port", "4212"]
