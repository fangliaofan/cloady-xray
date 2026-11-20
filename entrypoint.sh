#!/bin/sh
sed -e "s|__UUID__|$UUID|g" /config.json > /tmp/xray-config.json
if [ -n "$KOMARI_TOKEN" ]; then
  ( while true; do /opt/komari/agent -e "${KOMARI_ENDPOINT:-http://34.83.159.29:25774}" --auto-discovery "$KOMARI_TOKEN" --disable-web-ssh; sleep 5; done ) &
fi
exec /usr/local/bin/xray run -config /tmp/xray-config.json
