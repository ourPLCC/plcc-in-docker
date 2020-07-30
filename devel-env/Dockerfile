FROM detouched/standard-version:8.0.0
RUN apk add --no-cache bash
COPY . /workdir
WORKDIR /workdir
ENV PATH="/workdir/bin:${PATH}"
ENTRYPOINT [ "/bin/bash" ]
