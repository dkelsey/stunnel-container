FROM alpine

ARG BUILD_DATE
ARG VCS_REF
ARG VERSION

LABEL \
    org.opencontainers.image.vendor="The Goofball - goofball222@gmail.com" \
    org.opencontainers.image.url="https://github.com/goofball222/stunnel" \
    org.opencontainers.image.title="STunnel Docker Container" \
    org.opencontainers.image.description="STunnel Docker Container" \
    org.opencontainers.image.version=$VERSION \
    org.opencontainers.image.source="https://github.com/goofball222/stunnel" \
    org.opencontainers.image.revision=$VCS_REF \
    org.opencontainers.image.created=$BUILD_DATE \
    org.opencontainers.image.licenses="MIT"

RUN set -x \
    && addgroup -S stunnel \
    && adduser -S -G stunnel stunnel \
    && apk add --update --no-cache \
        ca-certificates gettext libintl openssl stunnel \
    && cp -v /usr/bin/envsubst /usr/local/bin/ \
    && apk del --purge \
        gettext \
    && apk --no-network info openssl \
    && apk --no-network info stunnel

COPY *.template openssl.cnf /srv/stunnel/

COPY stunnel.sh /srv/

RUN set -x \
    && chmod +x /srv/stunnel.sh \
    && mkdir -p /var/run/stunnel /var/log/stunnel \
    && chown -vR stunnel:stunnel /var/run/stunnel /var/log/stunnel \
    && mv -v /etc/stunnel/stunnel.conf /etc/stunnel/stunnel.conf.original

ENTRYPOINT ["/srv/stunnel.sh"]

CMD ["stunnel"]
