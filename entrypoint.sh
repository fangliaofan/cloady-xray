#!/bin/sh
sed -e "s|__UUID__|$UUID|g" /config.json > /tmp/xray-config.json
exec /usr/local/bin/xray run -config /tmp/xray-config.json
