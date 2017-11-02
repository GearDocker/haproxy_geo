FROM dockercloud/haproxy:latest
MAINTAINER Gary Leong <gwleong@gmail.com>

#RUN apk update && apk --no-cache add wget gcc gmake -y

ADD tool /var/tmp/tool

#RUN cd /var/tmp/tool && \
#    make && \
#    gcc -s -O3 -o iprange iprange.c
