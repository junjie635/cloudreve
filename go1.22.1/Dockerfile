FROM alpine:latest

RUN apk add --no-cache wget tar

WORKDIR /root

ENV GO_VERSION 1.22.1
ENV GO_URL https://golang.org/dl/go$GO_VERSION.linux-amd64.tar.gz

RUN wget -O go.tar.gz "$GO_URL" && tar -C /usr/local -xzf go.tar.gz && rm go.tar.gz

ENV PATH="/usr/local/go/bin:$PATH"