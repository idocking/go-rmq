# go-rmq
build go rocketmq client with rocketmq-client-cpp

```Dockerfile
FROM idocking/go-rmq:latest as builder
RUN go get -v github.com/apache/rocketmq-client-go/examples && \
	cd /go/src/github.com/apache/rocketmq-client-go/examples && \
	go build

FROM idocking/alpine:latest
COPY --from=builder ["/usr/local/lib/librocketmq.a", "/usr/local/lib/librocketmq.so", "/usr/lib/libgcc_s.so.1", "/lib/ld-musl-x86_64.so.1", "/usr/lib/libstdc++.so.6", "/usr/local/lib/"]
COPY --from=builder ["/go/src/github.com/apache/rocketmq-client-go/examples/examples", "/root/"]
RUN chmod +x /root/examples
CMD ["/root/examples"]
```
