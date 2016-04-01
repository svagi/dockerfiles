FROM alpine:3.3
MAINTAINER Jan Svager <jan@svager.cz>

ENV NGINX_VERSION='1.9.13' \
    NGINX_USER='nginx' \
    NGINX_GROUP='nginx' \
    OPENSSL_VERSION='1.0.2g' \
    INSTALL_DEPS='build-base wget perl' \
    RUNTIME_DEPS='ca-certificates pcre-dev zlib-dev'

RUN apk --no-cache add $INSTALL_DEPS $RUNTIME_DEPS \
    && wget -qO- http://nginx.org/download/nginx-$NGINX_VERSION.tar.gz | tar -xz \
    && wget -qO- http://www.openssl.org/source/openssl-$OPENSSL_VERSION.tar.gz | tar -xz \
    && addgroup -S $NGINX_USER \
    && adduser -SH -G $NGINX_GROUP $NGINX_USER \
    && cd /nginx-$NGINX_VERSION \
    && ./configure \
      --user=$NGINX_USER \
      --group=$NGINX_GROUP \
      --prefix=/etc/nginx \
      --sbin-path=/usr/sbin/nginx \
      --conf-path=/etc/nginx/nginx.conf \
      --error-log-path=/var/log/nginx/error.log \
      --http-log-path=/var/log/nginx/access.log \
      --pid-path=/var/run/nginx.pid \
      --lock-path=/var/run/nginx.lock \
      --http-client-body-temp-path=/tmp/client_temp \
      --http-proxy-temp-path=/tmp/proxy_temp \
      --with-openssl=/openssl-$OPENSSL_VERSION \
      --with-http_ssl_module \
      --with-http_realip_module \
      --with-http_gunzip_module \
      --with-http_gzip_static_module \
      --with-threads \
      --with-stream \
      --with-stream_ssl_module \
      --with-http_v2_module \
      --with-ipv6 \
      --with-http_stub_status_module \
    && make \
    && make install \
    && ln -sf /dev/stdout /var/log/nginx/access.log \
    && ln -sf /dev/stderr /var/log/nginx/error.log \
    && apk del $INSTALL_DEPS \
    && rm -rf /nginx-$NGINX_VERSION /openssl-$OPENSSL_VERSION

EXPOSE 80 443
CMD ["nginx", "-g", "daemon off;"]
