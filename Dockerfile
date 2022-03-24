# Fetch from rocky docker repo
FROM rockylinux/rockylinux:8

# Copy rpm macros 
COPY rpmmacros /root/.rpmmacros

# Shim needed changes
RUN dnf update -y
RUN dnf -y install wget gcc make elfutils-libelf-devel git openssl openssl-devel pesign dos2unix rpm-build
RUN rpm -e acl hostname
RUN rm -rfv /etc/yum.repos.d/*

