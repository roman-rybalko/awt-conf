#!/bin/sh -ex
. ./local.conf

tar -zcf `pwd`/web_construction_set.tgz -C $SRCD web_construction_set
