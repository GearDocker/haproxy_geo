#!/bin/bash

mv /etc/haproxy/GeoIPCountryCSV.zip /etc/haproxy/PreviousGeoIPCountryCSV.zip
rm -rf /etc/haproxy/geoip
mkdir -p /etc/haproxy/geoip 
cd /etc/haproxy/geoip
/bin/haproxy-geoip.sh > geoip.txt
wget http://dev.maxmind.com/static/csv/codes/country_continent.csv
for c in `grep -E -v "\-|iso" country_continent.csv | sort -t',' -k 2` ; do echo $c | awk -F',' '{ print $1 >> $2".continent" }' ; done
cut -d, -f1,2,5 GeoIPCountryWhois.csv | iprange | sed 's/"//g' | awk -F' ' '{ print $1 >> $2".subnets" }'
for f in `ls *.continent`; do for c in $(cat $f); do [[ -f ${c}.subnets ]] && cat ${c}.subnets >> ${f%%.*}.txt; done; done

sleep 90000000
