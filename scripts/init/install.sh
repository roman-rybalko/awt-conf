#! /bin/sh

set -e
set -x

cd "`dirname "$0"`"
chown -R root:root .

if ! grep 64022 /etc/ssh/sshd_config; then
	patch /etc/ssh/sshd_config < sshd_config.diff
	service ssh restart
fi

if ! grep swap /etc/fstab; then
	[ -e /swap ] || dd if=/dev/zero of=/swap bs=1M count=4096
	chmod 0600 /swap
	mkswap /swap
	cat fstab >> /etc/fstab
fi

grep hosts /etc/hostname || grep '\.' /etc/hostname || grep ' ' /etc/hostname || echo `cat /etc/hostname`.hosts.advancedwebtesting.net > /etc/hostname

grep 77.88 /etc/resolv.conf || cat resolv.conf >> /etc/resolv.conf

if ! grep www-data /etc/aliases; then
	echo "www-data: root" >> /etc/aliases
	newaliases
fi

if ! [ -e /etc/apt/sources.list.d/yandex.list ]; then
	sed -i 's/^deb/#deb/' /etc/apt/sources.list
	cp yandex.list /etc/apt/sources.list.d/
	cp ubuntu.list /root/
	apt-key add 3B4FE6ACC0B21F32.key
	apt-key add 40976EAF437D05B5.key
	apt-get update
fi

if ! [ -e /etc/skel/.forward ]; then
	echo root > /etc/skel/.forward
	chmod 0600 /etc/skel/.forward
	sed -i 's/#alias l/alias l/' /etc/skel/.bashrc
fi

apt-get --yes install mc sudo screen logwatch munin-node

if ! id roma; then
	useradd -m -U -G adm,sudo roma
	chfn --full-name 'Roman Rybalko' roma
	chsh -s /bin/bash roma
	chmod 0700 /home/roma
fi

if ! id client1; then
	for i in 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32; do
		useradd -m -U client$i
		chfn --full-name "AWT Client #$i on `hostname -s`" client$i
	done
	chmod 0700 /home/client*
fi

apt-get --yes install npm nodejs-legacy
apt-get --yes install xvfb dwm scrot openjdk-7-jre x11vnc

[ -e /etc/apt/sources.list.d/ubuntu.list ] || mv /root/ubuntu.list /etc/apt/sources.list.d/
apt-get update
apt-get --yes install firefox chromium-browser flashplugin-installer
mv /etc/apt/sources.list.d/ubuntu.list /root/
apt-get update
