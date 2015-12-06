#!/bin/sh -ex
. ./local.conf

tar -zcf `pwd`/advanced_web_testing.tgz -C $SRCD advanced_web_testing
