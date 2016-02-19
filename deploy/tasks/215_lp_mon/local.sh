#!/bin/sh -ex
. ./local.conf

tar -zcf `pwd`/lp-mon.tgz -C $SRCD/server/ lp-mon
