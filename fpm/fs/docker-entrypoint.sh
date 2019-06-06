#!/bin/sh

# Replace environment variables in nginx configuration file.
envsubst '$FCGI_HOST
          $FCGI_PORT
          $MAX_REQUEST_SIZE
          $WEBROOT
          $TIMEOUT' < /etc/nginx/nginx.conf | tee /etc/nginx/nginx.conf 1> /dev/null

# Run the nginx server.
exec nginx
