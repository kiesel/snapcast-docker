FROM alpine:latest

ARG VERSION 0.34.0

RUN apk --update add snapcast-server=$VERSION-r0

CMD ["/usr/bin/snapserver"]