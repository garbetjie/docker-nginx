FROM nginx:1.15.9-alpine

RUN set -e; \
    cd /etc/nginx; \
    rm -rf conf.d fastcgi* *.default *_params; \
    apk add --no-cache gettext

COPY fpm/. /etc/nginx/.
COPY entrypoint.sh /usr/local/bin/entrypoint.sh

ENV ALLOWED_STATUS_IPS="127.0.0.1" \
    FCGI_HOST="php" \
    FCGI_PORT=9000 \
    MAX_REQUEST_SIZE="8M" \
    ROOT="/app" \
    TIMEOUT=60 \
    TIMEZONE="Etc/UTC"

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
