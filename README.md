# Synapse with S3 Storage Provider

This repository provides a Docker image for [Matrix Synapse](https://github.com/matrix-org/synapse) with the [synapse-s3-storage-provider](https://github.com/matrix-org/synapse-s3-storage-provider) pre-installed.

This allows you to use an S3-compatible object storage for your Synapse media store.

## Usage

You can use this image as a drop-in replacement for the standard Synapse image. You will need to configure your `homeserver.yaml` to use the S3 storage provider.

Here is an example `homeserver.yaml` configuration:

```yaml
media_storage_providers:
  - module: s3_storage_provider.S3StorageProviderBackend
    store_local: true
    store_remote: true
    store_synchronous: true
    config:
      bucket: your-s3-bucket-name
      region_name: your-s3-region
      endpoint_url: https://your-s3-endpoint.com
```
### Docker Compose

Here is an example `docker-compose.yml` snippet:

```yaml
services:
  synapse:
    image: ghcr.io/nimscore/synapse-s3-storage:latest
    container_name: synapse
    restart: unless-stopped
    volumes:
      - ./data:/data
    environment:
      - SYNAPSE_CONFIG_PATH=/data/homeserver.yaml
      - AWS_ACCESS_KEY_ID=S3_ACCESS_KEY
      - AWS_SECRET_ACCESS_KEY=S3_SECRET_KEY
    networks:
      - docker_network

networks:
  docker_network:
    external: true
```

## Build versions

The image is built with the following versions:
- Synapse: `v1.144.0`
- synapse-s3-storage-provider: `v1.6.0`

## Customizing Versions

To change the versions of Synapse or the S3 storage provider, you need to edit the `ARG` values at the top of the `Dockerfile`.

```dockerfile
ARG SYNAPSE_VERSION=v1.144.0
ARG S3_PROVIDER_VERSION=v1.6.0
```

Modify these values and rebuild the Docker image.