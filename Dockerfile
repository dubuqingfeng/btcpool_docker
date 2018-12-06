FROM dubuqingfeng/btcpool-prebuild:ubuntu-librdkafka-0.11.4

RUN mkdir -p /work && \
    cd /work && \
    wget -O bitcoin-0.16.3.tar.gz https://github.com/bitcoin/bitcoin/archive/v0.16.3.tar.gz && \
    tar zxf bitcoin-0.16.3.tar.gz

ARG CHAIN_TYPE=BTC
ARG CHAIN_SRC_ROOT=/work/bitcoin-0.16.3
ARG POOL__WORK_WITH_STRATUM_SWITCHER=OFF

RUN mkdir -p /work && \
    cd /work && \
    git clone https://github.com/btccom/btcpool.git && \
    cd /work/btcpool && \
    mkdir build && \
    cd build && \
    cmake -DCHAIN_TYPE=${CHAIN_TYPE} -DCHAIN_SRC_ROOT=${CHAIN_SRC_ROOT} -DPOOL__WORK_WITH_STRATUM_SWITCHER=${POOL__WORK_WITH_STRATUM_SWITCHER} -DCMAKE_BUILD_TYPE=Debug .. && \
    make -j1 && \
    bash /work/btcpool/install/init_folders.sh