ARG VERSION="1.15.9"
FROM nginx:${VERSION}-alpine

RUN set -e; \
    cd /etc/nginx; \
    rm -rf conf.d fastcgi* *.default *_params; \
    apk add --no-cache gettext

ENV FPM_HOST="127.0.0.1" \
    FPM_PORT=9000 \
    FPM_STATUS_HOSTS_ALLOWED="172.16.0.0/12 127.0.0.1" \
    FPM_STATUS_HOSTS_DENIED="all" \
    FPM_STATUS_PATH="/_/status" \
    MAX_REQUEST_SIZE="16M" \
    WEBROOT="/app/public" \
    TIMEOUT=600

COPY fs/ /

WORKDIR "/app"

ENTRYPOINT ["/docker-entrypoint.sh"]
