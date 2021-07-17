FROM rockylinux/rockylinux:8

COPY rpmmacros /root/.rpmmacros

RUN yum -y install wget gcc make elfutils-libelf-devel git openssl openssl-devel pesign dos2unix rpm-build
RUN rpm -e acl hostname
RUN rm -rfv /etc/yum.repos.d/*
