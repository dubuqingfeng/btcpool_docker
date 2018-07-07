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
# librdkafka-v0.11.4
apt-get install -y zlib1g zlib1g-dev
mkdir -p /root/source && cd /root/source
wget https://github.com/edenhill/librdkafka/archive/0.11.4.tar.gz
tar zxvf 0.11.4.tar.gz
cd librdkafka-0.11.4
./configure && make -j $CPUS && make install

# bitcoind
mkdir -p /work && cd /work
wget -O bitcoin-0.16.0.tar.gz https://github.com/bitcoin/bitcoin/archive/v0.16.0.tar.gz
tar zxf bitcoin-0.16.0.tar.gz