FROM dockercloud/haproxy:latest
MAINTAINER Gary Leong <gwleong@gmail.com>

RUN apk update && apk --no-cache add wget gcc gmake -y
ADD tools /var/tmp/tools
RUN cd /var/tmp/tools && \
    make && \
    gcc -s -O3 -o iprange iprange.c
