FROM nginx:1.15.9-alpine

RUN set -e; \
    cd /etc/nginx; \
    rm -rf conf.d fastcgi* *.default *_params; \
    apk add --no-cache gettext

COPY fs/ /

ENV ECHO="(unset)"
ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["nginx"]
