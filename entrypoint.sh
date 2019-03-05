#!/bin/sh

# Replace environment variables in nginx configuration file.
envsubst '$ALLOWED_STATUS_IPS
          $FCGI_HOST
          $FCGI_PORT
          $MAX_REQUEST_SIZE
          $ROOT
          $TIMEOUT' < /etc/nginx/nginx.conf > /etc/nginx/nginx.conf-tmp

# Move the updated file.
mv /etc/nginx/nginx.conf-tmp /etc/nginx/nginx.conf

# Run the nginx server.
exec nginx
