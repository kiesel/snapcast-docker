FROM alpine:3.23.3 AS snapweb

ARG SNAPWEB_VERSION="v0.9.3"

RUN apk add --no-cache unzip curl \
 && curl -LO https://github.com/badaix/snapweb/releases/download/${SNAPWEB_VERSION}/snapweb.zip \
 && unzip snapweb.zip -d snapweb

FROM alpine:3.23.3

ARG SNAPCAST_VERSION="0.34.0"

RUN apk --update --no-cache add snapcast-server=${SNAPCAST_VERSION}-r0

COPY --from=snapweb /snapweb /usr/share/snapserver/snapweb

ENTRYPOINT ["/usr/bin/snapserver"]