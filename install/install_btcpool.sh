#!/bin/bash
#
# init install script for btcpool
#
# OS: Ubuntu 14.04 LTS
# 
# @copyright btc.com
# @author Kevin Pan
# @since 2016-08
#

CPUS=`lscpu | grep '^CPU(s):' | awk '{print $2}'`
# btcpool
mkdir -p /work && cd /work
git clone https://github.com/btccom/btcpool.git
cd /work/btcpool
mkdir build && cd build
cmake -DCHAIN_TYPE=BTC -DCHAIN_SRC_ROOT=/work/bitcoin-0.16.0 -DPOOL__WORK_WITH_STRATUM_SWITCHER=OFF -DCMAKE_BUILD_TYPE=Debug ..
make -j1