FROM caddy:2.5.1-builder AS builder

RUN xcaddy build --with github.com/caddy-dns/digitalocean

FROM caddy:2.5.1

COPY --from=builder /usr/bin/caddy /usr/bin/caddy

COPY Caddyfile /etc/caddy/Caddyfile
