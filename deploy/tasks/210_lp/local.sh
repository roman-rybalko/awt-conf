#!/bin/sh -ex
. ./local.conf

tar -zcf `pwd`/lp.tgz -C $SRCD/server/ lp
