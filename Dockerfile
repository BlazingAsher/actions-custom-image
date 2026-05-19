ARG UBUNTU_VERSION=latest
FROM docker.gitea.com/runner-images:ubuntu-${UBUNTU_VERSION}
RUN apt-get update && apt-get install -y buildah