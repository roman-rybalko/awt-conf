#! /bin/sh

set -e
set -x

rm -Rf lp
tar -xf lp.tgz
chmod -R a+rX,a-ws lp

cat /var/www/awt/lp/VERSION
cat lp/VERSION

service nginx stop

mv /var/www/awt/lp /var/www/awt/lp.bak
mv lp /var/www/awt/

service nginx start

cat /var/www/awt/lp/VERSION

rm -Rf /var/www/awt/lp.bak
rm -f lp.tgz
rm -f $0
