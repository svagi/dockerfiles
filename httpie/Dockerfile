FROM alpine:edge
MAINTAINER Jan Svager <jan@svager.cz>
RUN apk --no-cache add ca-certificates python py-pip \
 && pip install -U httpie httpie-http2 httpie-unixsocket
ENTRYPOINT ["http"]
