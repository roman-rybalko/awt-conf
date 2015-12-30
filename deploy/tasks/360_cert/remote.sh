#!/bin/sh -ex
. ./remote.conf

chmod -v 0444 advancedwebtesting_com.crt
chmod -v 0440 advancedwebtesting_com.key
chown -v root:ssl-cert advancedwebtesting_com.*

mv -vf advancedwebtesting_com.crt /etc/ssl/certs/
mv -vf advancedwebtesting_com.key /etc/ssl/private/
