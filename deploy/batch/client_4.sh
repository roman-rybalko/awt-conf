#!/bin/sh -ex
. ./framework.sh
export CLIENT_N=4
deploy_batch 320_client_n
