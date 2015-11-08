#! /bin/sh

set -e
set -x

rm -Rf advanced_web_testing
tar -xf advanced_web_testing.tgz
chmod -R a+rX,a-ws advanced_web_testing

service nginx stop

mv /var/www/awt/advanced_web_testing /var/www/awt/advanced_web_testing.bak
mv advanced_web_testing /var/www/awt/

service nginx start

rm -Rf /var/www/awt/advanced_web_testing.bak
rm -f advanced_web_testing.tgz
rm -f $0
