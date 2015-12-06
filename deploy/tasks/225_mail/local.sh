#!/bin/sh -ex
. ./local.conf

tar -zcf `pwd`/mail.tgz -C $SRCD mail
