#!/bin/sh

# Build up the list of hosts that are allowed to access the FPM status path.
IFS=" "
fpm_status_hosts_formatted=""

for cidr in $FPM_STATUS_HOSTS_ALLOWED; do
    [[ "$cidr" != "" ]] && fpm_status_hosts_formatted="${fpm_status_hosts_formatted}            allow ${cidr};"$'\n'
done

for cidr in $FPM_STATUS_HOSTS_DENIED; do
    [[ "$cidr" != "" ]] && fpm_status_hosts_formatted="${fpm_status_hosts_formatted}            deny ${cidr};"$'\n'
done

export FPM_STATUS_HOSTS_FORMATTED="$fpm_status_hosts_formatted"

# Replace environment variables in nginx configuration file.
IFS=$'\n'
for file in `find /etc/nginx -type f -iname '*.conf'`; do
    envsubst '$FPM_HOST
              $FPM_PORT
              $FPM_STATUS_PATH
              $FPM_STATUS_HOSTS_FORMATTED
              $MAX_REQUEST_SIZE
              $WEBROOT
              $TIMEOUT' < "$file" > "${file}.tmp"

    mv "${file}.tmp" "$file"
done

# Run the nginx server.
exec nginx
