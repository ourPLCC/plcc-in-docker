FROM detouched/standard-version:8.0.0
RUN apk add --no-cache bash=5.0.11-r1
COPY --from=docker/compose:alpine-1.26.2 /usr/local/bin/docker-compose /usr/bin/docker-compose
WORKDIR /workdir
ENV PATH="/workdir/bin:${PATH}"
ENTRYPOINT [ "/bin/bash" ]
