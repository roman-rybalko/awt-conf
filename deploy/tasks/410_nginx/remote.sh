#!/bin/sh -ex
. ./remote.conf

apt-get update
apt-get --yes install nginx

if ! grep www-data /etc/aliases; then
	echo "www-data: root" >> /etc/aliases
	newaliases
fi

mv -vf robots.txt index.html /var/www/html/
mv -vf conf.d/* /etc/nginx/conf.d/
mv -vf sites-available/* /etc/nginx/sites-available/
mv -vf snippets/* /etc/nginx/snippets/

patch -b /etc/nginx/mime.types < mime.types.diff

chmod -v 0444 /var/www/html/robots.txt /var/www/html/index.html /etc/nginx/conf.d/* /etc/nginx/sites-available/* /etc/nginx/snippets/*
chown -v root:root /var/www/html/robots.txt /etc/nginx/conf.d/* /etc/nginx/sites-available/* /etc/nginx/snippets/*

cd /etc/nginx/sites-enabled/
rm -vf *
for s in awt awt-mon catchall deploy status; do
	ln -sv ../sites-available/$s ./
done

service nginx restart

ln -svf /usr/share/munin/plugins/nginx_* /etc/munin/plugins/
service munin-node restart
