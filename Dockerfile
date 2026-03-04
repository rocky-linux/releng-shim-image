# Fetch from rocky docker repo
FROM rockylinux/rockylinux:9

# Copy rpm macros 
COPY rpmmacros /root/.rpmmacros

# Shim needed changes
RUN dnf update -y
RUN dnf --enablerepo=crb -y install wget gcc make elfutils-libelf-devel git openssl openssl-devel pesign dos2unix rpm-build dnf-plugins-core rocky-sb-certs
RUN rm -rfv /etc/yum.repos.d/*
