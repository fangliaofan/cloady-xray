#!/bin/sh
sed -e "s|__UUID__|$UUID|g" /config.json > /usr/local/etc/xray-config.json
exec /usr/local/bin/xray run -config /usr/local/etc/xray-config.json
