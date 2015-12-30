#!/bin/sh -ex
. ./framework.sh
export RSYNC_USER=awt-repl
export RSYNC_PASSWORD=ziZianQTGxlDBfZy4LdG9s
export RSYNC_PW=ziZianQTGxlDBfZy4LdG9s
export MYSQL_USER=awt-repl-adm
export MYSQL_PASSWORD=ubEBbVnoy0cCOiW876hNgd
deploy_batch 270_www_repl_del 280_www_repl 231_awt_cron_del 170_mysql_slave_1 171_mysql_slave_2
