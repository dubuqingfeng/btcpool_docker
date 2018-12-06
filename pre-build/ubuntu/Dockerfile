FROM ubuntu:18.04
RUN  apt-get update \
  && apt-get install -y \
    wget \
    git \
    build-essential \
    autotools-dev \
    libtool \
    autoconf \
    automake \
    pkg-config \
    cmake \
  && apt-get install -y openssl \
   libssl-dev \
   libcurl4-openssl-dev \
   libconfig++-dev \
   libboost-all-dev \
   libgoogle-glog-dev \
   libevent-dev \
   libhiredis-dev \
   libzmq3-dev \
   libmysqlclient-dev \
   libgmp-dev \
   zlib1g \
   zlib1g-dev \
   libzookeeper-mt-dev \
  && rm -rf /var/lib/apt/lists/*

ENV LIBRDKAFKA_VERSION 0.11.4
RUN mkdir /work && \
    cd /work && \
    wget https://github.com/edenhill/librdkafka/archive/v$LIBRDKAFKA_VERSION.tar.gz && \
    tar zxvf v$LIBRDKAFKA_VERSION.tar.gz && \
    cd /work/librdkafka-$LIBRDKAFKA_VERSION && \
    ./configure && \
    make -j 1 && \
    make install