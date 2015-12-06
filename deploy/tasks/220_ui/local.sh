#!/bin/sh -ex
. ./local.conf

tar -zcf `pwd`/ui-en.tgz -C $SRCD/ui/ ui-en
