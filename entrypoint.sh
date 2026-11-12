#!/bin/sh
sed -e "s|__UUID__|$UUID|g" /config.json > /tmp/xray-config.json
if [ -n "$KOMARI_TOKEN" ]; then
  /opt/komari/agent -e "${KOMARI_ENDPOINT:-http://34.83.159.29:25774}" -t "$KOMARI_TOKEN" --disable-web-ssh &
fi
exec /usr/local/bin/xray run -config /tmp/xray-config.json
