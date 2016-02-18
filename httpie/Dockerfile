FROM alpine:latest
MAINTAINER Jan Svager <jan@svager.cz>
RUN apk --no-cache add \
  ca-certificates \
  py-pip \
 && pip install -U httpie httpie-http2
ENTRYPOINT ["http"]
