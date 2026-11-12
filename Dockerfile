FROM ghcr.io/xtls/xray-core:latest AS xray-src
FROM alpine:3.20
RUN apk add --no-cache ca-certificates
COPY --from=xray-src /usr/local/bin/xray /usr/local/bin/xray
ADD https://github.com/komari-monitor/komari-agent/releases/download/1.5.11/komari-agent-linux-amd64 /opt/komari/agent
RUN echo "78c28d89e523816baea010c0ed0714f245f508ffdaca0540f5c9f230f7053c8c  /opt/komari/agent" | sha256sum -c -
COPY config.json /config.json
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh /usr/local/bin/xray /opt/komari/agent
EXPOSE 3000
ENTRYPOINT ["/entrypoint.sh"]
