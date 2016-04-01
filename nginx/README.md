# NGINX

[![](https://badge.imagelayers.io/svagi/nginx:latest.svg)](https://imagelayers.io/?images=svagi/nginx:latest)

- based on **Alpine Linux**
- with **HTTP/2** support
- with **latest** version of the **OpenSSL** library (1.0.2g 1 Mar 2016)

## Version
- latest mainline (1.9.13) ([Dockerfile](https://github.com/svagi/dockerfiles/blob/master/nginx/Dockerfile))

## Motivation
- Minimal image size.
- Support HTTP/2 connections over ALPN instead of NPN.

From [nginx documentation](http://nginx.org/en/docs/http/ngx_http_v2_module.html):
> Note that accepting HTTP/2 connections over TLS requires the “Application-Layer Protocol Negotiation” (ALPN) TLS extension support, which is available only since OpenSSL version 1.0.2. Using the “Next Protocol Negotiation” (NPN) TLS extension for this purpose (available since OpenSSL version 1.0.1) is not guaranteed.
