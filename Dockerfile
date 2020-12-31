FROM alpine:latest

RUN apk update && apk --no-cache add openssl

ENV HUGO_VERSION=0.79.1

RUN wget "https://github.com/gohugoio/hugo/releases/download/v${HUGO_VERSION}/hugo_${HUGO_VERSION}_Linux-64bit.tar.gz" && \
    mkdir -p hugo && \
    tar -xf "hugo_${HUGO_VERSION}_Linux-64bit.tar.gz" --directory hugo && \
    mv hugo/hugo /usr/local/bin && \
    rm -rf hugo && \
    hugo version


EXPOSE 1313
WORKDIR /app

ENTRYPOINT hugo
