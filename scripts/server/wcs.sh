#! /bin/sh

set -e
set -x

rm -Rf web_construction_set
tar -xf web_construction_set.tgz
chmod -R a+rX,a-ws web_construction_set

service nginx stop

mv /var/www/awt/web_construction_set /var/www/awt/web_construction_set.bak
mv web_construction_set /var/www/awt/

service nginx start

rm -Rf /var/www/awt/web_construction_set.bak
rm -f web_construction_set.tgz
rm -f $0
