#!/bin/sh

export PORT

envsubst '${PORT}' < /nginx.template > /etc/nginx/conf.d/default.conf

exec "$@"