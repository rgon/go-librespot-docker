FROM alpine:3.20 AS librespot-builder
WORKDIR /app

ARG LIBRESPOT_VERSION=0.4.2

RUN apk add go git libvorbis-dev alsa-lib-dev libogg-dev

RUN git clone -b master "https://github.com/devgianlu/go-librespot/"

WORKDIR /app/go-librespot

RUN go build -o go-librespot-daemon ./cmd/daemon

FROM alpine:3.20 AS run


# RUN apk add librespot@testing
RUN apk add alsa-lib alsa-utils libvorbis libogg

RUN mkdir -p /usr/bin/go-librespot
COPY --from=librespot-builder /app/go-librespot/go-librespot-daemon /usr/bin/go-librespot/go-librespot-daemon
WORKDIR /usr/bin/go-librespot
CMD [ "/usr/bin/go-librespot/go-librespot-daemon -credentials_path ./credentials/credentials.yml" ]
