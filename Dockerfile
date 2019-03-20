ARG SRC_VERSION_TAG="1.15.9-alpine"
FROM nginx:${SRC_VERSION_TAG}

RUN set -e; \
    rm -rf /etc/nginx; \
    mkdir /etc/nginx; \
    apk add --no-cache gettext

COPY fs/ /

ENV FCGI_HOST="127.0.0.1" \
    FCGI_PORT=9000 \
    MAX_REQUEST_SIZE="8M" \
    WEBROOT="/app/public" \
    TIMEOUT=60

WORKDIR "/app"

ENTRYPOINT ["/docker-entrypoint.sh"]
