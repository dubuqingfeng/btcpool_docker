FROM ubuntu
RUN  apt-get update \
  && apt-get install -y wget git build-essential autotools-dev libtool autoconf automake pkg-config cmake \
  && apt-get install -y openssl libssl-dev libcurl4-openssl-dev libconfig++-dev libboost-all-dev libgoogle-glog-dev libevent-dev libhiredis-dev libzmq3-dev libmysqlclient-dev libgmp-dev libzookeeper-mt-dev \
  && rm -rf /var/lib/apt/lists/*

RUN mkdir /work
RUN cd /work
COPY install/install_dependency.sh install_dependency.sh
RUN bash ./install_dependency.sh

COPY install/install_btcpool.sh install_btcpool.sh
RUN bash ./install_btcpool.sh

COPY install/init_folders.sh init_folders.sh
RUN bash ./init_folders.sh