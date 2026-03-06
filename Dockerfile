ARG ImageVersion

FROM rockylinux/rockylinux:$ImageVersion

LABEL com.github.containers.toolbox="true" \
      usage="This image is meant to be used for shim validation" \
      org.opencontainers.image.authors="Releng team <releng@rockylinux.org>" \
      org.opencontainers.image.description="Base image for creating Rocky Linux shim reviews" \
      org.opencontainers.image.licenses="BSD-3-Clause" \
      org.opencontainers.image.url="https://github.com/rocky-linux/releng-shim-image" \
      org.opencontainers.image.vendor="Rocky Enterprise Software Foundation"

# Copy rpm macros 
COPY rpmmacros /root/.rpmmacros

# Shim needed changes
RUN dnf update -y
RUN dnf --enablerepo=crb -y install wget gcc make elfutils-libelf-devel git openssl openssl-devel pesign dos2unix rpm-build dnf-plugins-core rocky-sb-certs
RUN rm -rfv /etc/yum.repos.d/*

