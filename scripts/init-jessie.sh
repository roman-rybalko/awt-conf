#! /bin/sh

set -e
set -x

apt-get update
apt-get --purge --yes install mc sudo screen logwatch dialog
apt-get --purge --yes install postfix
dpkg-reconfigure locales

echo "root: root@advancedwebtesting.com" >> /etc/aliases
newaliases

if ! id roma; then
	useradd -m -U -G adm,sudo roma
	chsh -s /bin/bash roma
	chmod 0700 /home/roma
	echo "roma: root" >> /etc/aliases
	newaliases
fi
