# Ruby environment
#
# VERSION               0.1

FROM ubuntu
MAINTAINER Muriel Salvan <muriel@x-aeon.com>

RUN echo "deb http://archive.ubuntu.com/ubuntu precise main universe" > /etc/apt/sources.list
RUN apt-get update
RUN apt-get upgrade -y

RUN apt-get install -y build-essential

ADD http://cache.ruby-lang.org/pub/ruby/2.1/ruby-2.1.0.tar.gz /tmp/

RUN cd /tmp && \
    tar -xzf ruby-2.1.0.tar.gz && \
    cd ruby-2.1.0 && \
    ./configure && \
    make && \
    make install && \
    cd .. && \
    rm -rf ruby-2.1.0 && \
    rm -f ruby-2.1.0.tar.gz
