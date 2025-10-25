# docker-caddy

This repository builds a custom Caddy Docker image including the forwardproxy plugin, based on the official Caddy Alpine image.

## Building Locally
To build the image locally:
`docker build -t ghcr.io/hobbsAU/caddy-forwardproxy:latest .`

## Docker Compose Example
Here's a sample `docker-compose.yml` to run the container. Create this file in your working directory and run `docker compose up -d`.

```yaml
services:
  caddy:
    image: ghcr.io/hobbsAU/caddy-forwardproxy:latest
    restart: unless-stopped
    cap_add:
      - NET_ADMIN
    ports:
      - "80:80"
      - "443:443"
      - "443:443/udp"
    volumes:
      - $PWD/conf:/etc/caddy
      - $PWD/site:/srv
      - caddy_data:/data
      - caddy_config:/config

volumes:
  caddy_data:
  caddy_config:
```
