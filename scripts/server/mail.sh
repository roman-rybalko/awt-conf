#! /bin/sh

set -e
set -x

rm -Rf mail
tar -xf mail.tgz
chmod -R a+rX,a-ws mail

mv /var/www/awt/mail /var/www/awt/mail.bak
mv mail /var/www/awt/

rm -Rf /var/www/awt/mail.bak
rm -f mail.tgz
rm -f $0
