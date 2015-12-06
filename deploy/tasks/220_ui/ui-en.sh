#! /bin/sh

set -e
set -x

rm -Rf ui-en
tar -xf ui-en.tgz
chmod -R a+rX,a-ws ui-en

cat /var/www/awt/ui/ui-en/VERSION
cat ui-en/VERSION

service nginx stop

mv /var/www/awt/ui/ui-en /var/www/awt/ui/ui-en.bak
mv ui-en /var/www/awt/ui/

service nginx start

cat /var/www/awt/ui/ui-en/VERSION

rm -Rf /var/www/awt/ui/ui-en.bak
rm -f ui-en.tgz
rm -f $0
