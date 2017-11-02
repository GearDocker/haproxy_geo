FROM haproxytech/haproxy-ubuntu
MAINTAINER Gary Leong <gwleong@gmail.com>

ADD tool /var/tmp/tool

RUN apt-get update -y && apt-get install gzip zip wget gcc make -y && \
    cd /var/tmp/tool && \
    make && \
    gcc -s -O3 -o iprange iprange.c && \
    apt-get purge gcc make -y && \
    mv iprange /bin/
