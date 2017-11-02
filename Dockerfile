FROM haproxytech/haproxy-ubuntu
MAINTAINER Gary Leong <gwleong@gmail.com>

RUN apt-get update -y && apt-get install wget gcc make -y

ADD tool /var/tmp/tool

RUN cd /var/tmp/tool && \
    make && \
    gcc -s -O3 -o iprange iprange.c
