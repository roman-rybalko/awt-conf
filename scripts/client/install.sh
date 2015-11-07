#! /bin/sh

set -e
set -x

wd=`mktemp -d`
cd $wd/
h=`hostname -s`
for n in home home-x home-p system $h; do
	wget http://deploy/client/$n.tgz -O - | tar -xz
done
chown -R root:root .
chmod -R a+rX,a-ws .

cd $wd/$h/
for i in 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32; do
	[ -d client$i ] || continue
	useradd -m -U client$i
	chfn --full-name "AWT Client #$i on $h" client$i
done
chmod 0700 /home/client*

cd $wd/home/
for c in /home/client*; do
	cp -a * $c/
done

cd $wd/$h/
for c in client*; do
	cp -avf $c/* /home/$c/client/
done

cd $wd/
for c in /home/client*; do
	if grep x_display $c/client/config.js | grep -v //x_display; then
		cp -avf home-x/* home-x/.??* $c/
	else
		cp -avf home-p/* home-p/.??* $c/
	fi
done

cd $wd/system/
cp -af awt-client /etc/init.d/
update-rc.d awt-client defaults
cp -af watchdog.sh /root/
crontab -l > root.crontab
echo "*/10 * * * * /root/watchdog.sh 10 /home/client1/config.sh" >> root.crontab
crontab root.crontab
cp -af logrotate/* /etc/logrotate.d/

service awt-client start
service awt-client status

cd /tmp/
rm -Rf $wd
