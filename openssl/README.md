# OpenSSL

[![](https://images.microbadger.com/badges/version/svagi/openssl.svg)](http://microbadger.com/images/svagi/openssl)

## Usage

### Check OpenSSL version
```
docker run --rm svagi/openssl version
```

### Generate self signed certificates for nginx
```
docker run --rm -it -w /home -v $PWD:/home svagi/openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout nginx.key -out nginx.crt
```
