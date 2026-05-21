ARG UBUNTU_VERSION=latest
FROM docker.gitea.com/runner-images:ubuntu-${UBUNTU_VERSION}

# Tool Versions
ARG DNSCONTROL_VERSION=4.39.0
ARG ASK_VERSION=0.0.1

# Build it
RUN apt-get update && apt-get install -y --no-install-recommends \
    buildah \
    wget \
    && wget -O /tmp/dnscontrol.deb "https://github.com/DNSControl/dnscontrol/releases/download/v${DNSCONTROL_VERSION}/dnscontrol-${DNSCONTROL_VERSION}.amd64.deb" \
    && apt-get install -y --no-install-recommends /tmp/dnscontrol.deb \
    && wget -O /usr/local/bin/ask "https://github.com/BlazingAsher/manual-pipeline-action/releases/download/v${ASK_VERSION}/ask-linux-amd64" \
    && chmod +x /usr/local/bin/ask \
    && rm -rf /tmp/dnscontrol.deb /var/lib/apt/lists/*
