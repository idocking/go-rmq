FROM golang:1.14

RUN apt update && \
	apt install -y gcc g++ cmake automake autoconf libtool make linux-headers-4.19.0-9-all libbz2-dev zlib1g-dev git openssh-client unzip && \
	mkdir /temp && \
	cd /temp && \
	wget -q https://github.com/apache/rocketmq-client-cpp/archive/2.2.0.zip && \
	unzip 2.2.0.zip && \
	cd rocketmq-client-cpp-2.2.0 && \
	./build.sh && \
	mkdir -p /usr/local/include/rocketmq && \
	cp include/* /usr/local/include/rocketmq && \
	cp bin/librocketmq.* /usr/local/lib && \
	cp bin/librocketmq.* /usr/lib && \
	rm -rf /temp && \
	apt-get autoremove -y && \
	rm -rf /var/lib/apt/lists/*