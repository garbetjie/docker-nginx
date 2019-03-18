#!/bin/sh

# Replace environment variables in nginx configuration file.
envsubst '$FCGI_HOST
          $FCGI_PORT
          $MAX_REQUEST_SIZE
          $WEBROOT
          $TIMEOUT' < /etc/nginx/nginx.conf > /etc/nginx/.nginx.conf

# Move the updated file.
mv /etc/nginx/.nginx.conf /etc/nginx/nginx.conf

# Run the nginx server.
exec nginx
