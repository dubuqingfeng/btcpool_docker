FROM dubuqingfeng/btcpool-prebuild:ubuntu-librdkafka-0.11.4

RUN mkdir -p /work && \
    cd /work && \
    wget -O bitcoin-0.16.3.tar.gz https://github.com/bitcoin/bitcoin/archive/v0.16.3.tar.gz && \
    tar zxf bitcoin-0.16.3.tar.gz

RUN mkdir -p /work && \
    cd /work && \
    git clone https://github.com/btccom/btcpool.git && \
    cd /work/btcpool && \
    mkdir build && cd build && \
    cmake -DCHAIN_TYPE=BTC -DCHAIN_SRC_ROOT=/work/bitcoin-0.16.3 -DPOOL__WORK_WITH_STRATUM_SWITCHER=OFF -DCMAKE_BUILD_TYPE=Debug .. && \
    make -j1

COPY install/init_folders.sh init_folders.sh
RUN bash ./init_folders.sh