#!/bin/sh -ex
. ./remote.conf

rm -vf /etc/mysql/conf.d/disable.cnf
service mysql start
