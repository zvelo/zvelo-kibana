#!/bin/bash

sed -i "s|{{ZVELO_ELASTICSEARCH_PUBLIC_URL}}|$ZVELO_ELASTICSEARCH_PUBLIC_URL|g" /kibana/config.js
exec nginx -g "daemon off;" "$@"
