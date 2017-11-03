FROM haproxytech/haproxy-ubuntu
MAINTAINER Gary Leong <gwleong@gmail.com>

ADD tool /var/tmp/tool
ADD populate_geo.sh /bin/populate_geo.sh
ADD haproxy-geoip.sh /bin/haproxy-geoip.sh

RUN apt-get update -y && apt-get install gzip zip wget gcc make -y && \
    cd /var/tmp/tool && \
    make && \
    gcc -s -O3 -o iprange iprange.c && \
    apt-get purge gcc make -y && \
    mv iprange /bin/

RUN /bin/populate_geo.sh
