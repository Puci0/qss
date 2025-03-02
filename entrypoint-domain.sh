#!/bin/sh

find /usr/share/nginx/html -type f -name "main.*.js" -exec sed -i "s|<DOMAIN>|$DOMAIN|g" {} \;
