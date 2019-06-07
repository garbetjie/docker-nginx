#!/bin/sh

# Replace environment variables in nginx configuration file.
IFS=$'\n'
for file in `find /etc/nginx -type f -iname '*.conf'`; do
    envsubst '$FCGI_HOST
              $FCGI_PORT
              $MAX_REQUEST_SIZE
              $WEBROOT
              $TIMEOUT' < "$file" | tee "$file" 1> /dev/null
done

# Run the nginx server.
exec nginx
