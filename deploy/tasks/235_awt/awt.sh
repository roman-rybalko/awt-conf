#! /bin/sh

set -e
set -x

rm -Rf advanced_web_testing
tar -xf advanced_web_testing.tgz
chmod -R a+rX,a-ws advanced_web_testing

cat /var/www/awt/advanced_web_testing/VERSION
cat advanced_web_testing/VERSION

service nginx stop

mv /var/www/awt/advanced_web_testing /var/www/awt/advanced_web_testing.bak
mv advanced_web_testing /var/www/awt/

service nginx start

cat /var/www/awt/advanced_web_testing/VERSION

rm -Rf /var/www/awt/advanced_web_testing.bak
rm -f advanced_web_testing.tgz
rm -f $0
