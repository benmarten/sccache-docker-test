# syntax=docker/dockerfile:experimental
from rust

RUN cargo install sccache

ENV HOME=/home/root
ENV SCCACHE_CACHE_SIZE="1G"
ENV SCCACHE_DIR=$HOME/.cache/sccache
ENV RUSTC_WRAPPER="/usr/local/cargo/bin/sccache"

WORKDIR $HOME/app

ADD src src
ADD Cargo.lock Cargo.lock
ADD Cargo.toml Cargo.toml

# Start sccache.
RUN sccache --start-server
RUN sccache --show-stats

# Build & fill cache.
RUN --mount=target=$HOME/.cache/sccache,rw \
	cargo build
RUN sccache --show-stats

# Clear cargo cache & rebuild, using cache.
RUN rm -rf target
RUN --mount=target=$HOME/.cache/sccache,rw \
	cargo build
RUN sccache --show-stats
