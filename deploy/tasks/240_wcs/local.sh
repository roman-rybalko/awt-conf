#!/bin/sh -ex
. ./local.conf

tar -zcf `pwd`/web_construction_set.tgz -C $SRCD/server/ web_construction_set
