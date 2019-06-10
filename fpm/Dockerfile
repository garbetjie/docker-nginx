ARG VERSION="1.15.9"
FROM nginx:${VERSION}-alpine

RUN set -e; \
    cd /etc/nginx; \
    rm -rf conf.d fastcgi* *.default *_params; \
    apk add --no-cache gettext

ENV FCGI_HOST="fpm" \
    FCGI_PORT=9000 \
    MAX_REQUEST_SIZE="16M" \
    WEBROOT="/app/public" \
    TIMEOUT=600

COPY fs/ /

WORKDIR "/app"

ENTRYPOINT ["/docker-entrypoint.sh"]
