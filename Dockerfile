FROM caddy:builder-alpine AS builder

RUN xcaddy build \
    --with github.com/caddyserver/forwardproxy@caddy2

FROM caddy:alpine

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
