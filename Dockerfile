FROM debian:stretch
LABEL maintainer="daniel.pressler@gmail.com"

RUN apt-get update && apt-get -y install \
    bash \
    curl wget \
    pkg-config build-essential make automake autogen \
    tar xz-utils bzip2 gzip \
    file \
    rsync \
    sed \
    vim \
    git \
    python3 \
    bison \
    flex \
    bc \
    rpm \
    libssl-dev \
    libelf-dev \
    libz-dev \
    lsb-release

RUN mkdir -p /build/ /output/
ADD do_build /builder/
COPY gcc-builder/ /builder/gcc-builder/

WORKDIR /builder/

ENTRYPOINT ["./do_build"]
