#!/bin/sh -ex
. ./framework.sh
deploy_batch 350_cert_del 360_cert 400_nginx_del 410_nginx 430_munin_del 440_munin 450_php_del 460_php 470_php_awt 250_rsync_del 260_rsync
