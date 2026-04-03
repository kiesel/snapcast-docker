FROM alpine:latest

ARG SNAPCAST_VERSION 0.34.0

RUN apk --update add snapcast-server=$SNAPCAST_VERSION-r0

CMD ["/usr/bin/snapserver"]