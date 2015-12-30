#!/bin/sh -ex
. ./framework.sh
export MYSQL_USER=awt-repl-adm
export MYSQL_PASSWORD=ubEBbVnoy0cCOiW876hNgd
deploy_batch 231_awt_cron_del 236_awt_cron 270_www_repl_del 180_mysql_slave2master
