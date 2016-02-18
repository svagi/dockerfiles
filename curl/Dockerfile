FROM alpine:3.3
MAINTAINER Jan Svager <jan@svager.cz>

ENV NGHTTP2_VERSION=1.7.1 CURL_VERSION=7.47.1
RUN apk --no-cache add \
  build-base \
  ca-certificates \
  openssl-dev \
  perl \
  wget \
  zlib \
 && cd /tmp \
 && wget "https://github.com/tatsuhiro-t/nghttp2/releases/download/v${NGHTTP2_VERSION}/nghttp2-${NGHTTP2_VERSION}.tar.gz" -O - | tar -xz \
 && wget "https://curl.haxx.se/download/curl-${CURL_VERSION}.tar.gz" -O - | tar -xz \
 && cd /tmp/nghttp2-$NGHTTP2_VERSION \
 && ./configure \
 && make \
 && make install \
 && cd /tmp/curl-$CURL_VERSION \
 && ./configure --with-nghttp2=/usr/local --with-ssl \
 && make \
 && make install \
 && rm -rf /tmp/* \
 && apk del \
  build-base \
  openssl-dev \
  perl \
  wget

ENTRYPOINT ["curl"]
CMD ["--help"]
