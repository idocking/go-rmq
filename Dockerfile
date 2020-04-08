FROM golang:1.14-alpine

RUN apk add --no-cache \
	gcc \
	g++ \
	cmake \
	automake \
	autoconf \
	libtool \
	make \
	linux-headers \
	bzip2-dev \
	zlib-dev \
	git \
	openssh-client && \
	mkdir /temp && \
	cd /temp && \
	wget -q https://github.com/apache/rocketmq-client-cpp/archive/2.2.0.zip && \
	unzip 2.2.0.zip && \
	cd rocketmq-client-cpp-2.2.0 && \
	./build.sh && \
	mkdir -p /usr/local/include/rocketmq && \
	cp include/* /usr/local/include/rocketmq && \
	cp bin/librocketmq.* /usr/local/lib && \
	rm -rf /temp
