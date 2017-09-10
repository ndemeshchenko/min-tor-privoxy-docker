FROM alpine:edge

EXPOSE 8118 9050 9051

RUN echo '@testing http://nl.alpinelinux.org/alpine/edge/testing' >> /etc/apk/repositories && \
    apk --update add privoxy tor@testing runit@testing

COPY services /etc/runit/
COPY services/tor/config /etc/tor/torrc

CMD ["runsvdir", "/etc/runit"]