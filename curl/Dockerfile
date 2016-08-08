FROM alpine:3.4
MAINTAINER Jan Svager <jan@svager.cz>
RUN NGHTTP2_VERSION=1.13.0 CURL_VERSION=7.50.1 \
 && apk --no-cache add \
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
