#! /bin/sh

set -e
set -x

[ ! -e /etc/init.d/awt-client  ]

cd system/
chown -R root:root .
chmod -R a+rX,a-ws .

cp -af awt-client /etc/init.d/
update-rc.d awt-client defaults
service awt-client status || true
cp -af watchdog.sh /root/
cp -af logrotate/* /etc/logrotate.d/

crontab -l > root.crontab || true
if [ -z "`grep PATH root.crontab`" ]; then
	echo 'PATH=/bin:/sbin:/usr/bin:/usr/sbin' > root.crontab.new
	cat root.crontab >> root.crontab.new
	crontab root.crontab.new
	crontab -l
fi

cd ..
rm -Rvf system

