# By default we pin to amd64 sha. Use make docker to automatically adjust for arm64 versions.
ARG BASE_DOCKER_SHA="650cefc7292b429ac55e3f9cc49a55a4cdd58698474310bb280c5e57adebf40a"
FROM quay.io/prometheus/busybox@sha256:${BASE_DOCKER_SHA}
LABEL maintainer="The Thanos Authors"

COPY /thanos_tmp_for_docker /bin/thanos

RUN adduser \
    -D `#Dont assign a password` \
    -H `#Dont create home directory` \
    -u 1001 `#User id`\
    thanos && \
    chown thanos /bin/thanos
USER 1001
ENTRYPOINT [ "/bin/thanos" ]
