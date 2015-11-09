#! /bin/sh

# no set -e
set -x

service awt-client stop

cd /home/
for c in client*; do
	[ -d "$c" ] || continue
	pgrep -u $c | xargs kill
	while ! userdel -r $c; do sleep 1; done
done

update-rc.d -f awt-client remove

rm -f /etc/init.d/awt-client /etc/logrotate.d/awt-client

cd /tmp/
crontab -l | grep -v /root/watchdog > root.crontab
crontab root.crontab
rm -f root.crontab /root/watchdog.sh
rm -f $0
