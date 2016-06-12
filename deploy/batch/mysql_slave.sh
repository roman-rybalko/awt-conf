#!/bin/sh -ex
. ./framework.sh

export MYSQL_PW=xxx
export MYSQL_MASTER=s2 # s1 | s2
export RSYNC_MASTER=s2 # s1 | s2

export RSYNC_USER=awt-repl
export RSYNC_PASSWORD=ziZianQTGxlDBfZy4LdG9s
export RSYNC_PW=ziZianQTGxlDBfZy4LdG9s
export MYSQL_USER=awt-repl-adm
export MYSQL_PASSWORD=ubEBbVnoy0cCOiW876hNgd

deploy_batch 160_mysql 170_mysql_slave_1 171_mysql_slave_2
