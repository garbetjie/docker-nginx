ARG SRC_VERSION_TAG="1.15.9-alpine"
FROM nginx:${SRC_VERSION_TAG}

RUN set -e; \
    cd /etc/nginx; \
    rm -rf conf.d fastcgi* *.default *_params; \
    apk add --no-cache gettext

COPY fs/ /

ENV FCGI_HOST="127.0.0.1" \
    FCGI_PORT=9000 \
    MAX_REQUEST_SIZE="8M" \
    WEBROOT="/app" \
    TIMEOUT=60

ENTRYPOINT ["/docker-entrypoint.sh"]
