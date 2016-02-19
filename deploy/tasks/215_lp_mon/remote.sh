#!/bin/sh -ex
. ./remote.conf

rm -Rf lp-mon
tar -xf lp-mon.tgz
chmod -R a+rX,a-ws lp-mon

cat /var/www/awt/lp-mon/VERSION
cat lp-mon/VERSION

service nginx stop

mv /var/www/awt/lp-mon /var/www/awt/lp-mon.bak
mv lp-mon /var/www/awt/

service nginx start

cat /var/www/awt/lp-mon/VERSION

rm -Rf /var/www/awt/lp-mon.bak
rm -f lp-mon.tgz
