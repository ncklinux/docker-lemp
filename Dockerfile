FROM ubuntu:latest
MAINTAINER ncklinux

RUN echo "Docker local development environment with PHP, NGiNX, MySQL/MariaDB (LEMP stack)"
RUN apt-get update
RUN apt-get upgrade
