ARG SYNAPSE_VERSION=v1.144.0
FROM ghcr.io/element-hq/synapse:${SYNAPSE_VERSION}

ARG S3_PROVIDER_VERSION=v1.6.0
RUN pip3 install https://github.com/matrix-org/synapse-s3-storage-provider/archive/refs/tags/${S3_PROVIDER_VERSION}.tar.gz
