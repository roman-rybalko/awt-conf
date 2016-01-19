#!/bin/sh -ex
. ./framework.sh
export CLIENT_N=11
export LOCK_N=11
deploy_batch 320_client_n
