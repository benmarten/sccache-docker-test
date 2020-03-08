# syntax=docker/dockerfile:experimental
from rust

RUN cargo install sccache

ENV HOME=/home/root
ENV SCCACHE_CACHE_SIZE="1G"
ENV SCCACHE_DIR=$HOME/.cache/sccache
ENV RUSTC_WRAPPER="/usr/local/cargo/bin/sccache"

WORKDIR $HOME/app

ADD src src
ADD Cargo.lock .
ADD Cargo.toml .
ADD build.sh .

RUN chmod +x build.sh
RUN --mount=type=cache,target=/home/root/.cache/sccache bash -x build.sh
