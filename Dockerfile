FROM ghcr.io/xtls/xray-core:latest AS xray-src
FROM alpine:3.20
RUN apk add --no-cache ca-certificates
COPY --from=xray-src /usr/local/bin/xray /usr/local/bin/xray
COPY config.json /config.json
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh /usr/local/bin/xray
EXPOSE 3000
ENTRYPOINT ["/entrypoint.sh"]
