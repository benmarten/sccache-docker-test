# syntax=docker/dockerfile:experimental
from rust

# RUN cargo install sccache

ENV HOME=/home/root
# ENV SCCACHE_CACHE_SIZE="1G"
# ENV SCCACHE_DIR=$HOME/.cache/sccache
# ENV RUSTC_WRAPPER="/usr/local/cargo/bin/sccache"

WORKDIR $HOME/app

ADD src src
ADD Cargo.lock .
ADD Cargo.toml .

# Change this line to force docker recompilation from this step on.
# This will hit sccache the second time.
RUN echo 1

RUN --mount=type=cache,target=/usr/local/cargo/registry \
	--mount=type=cache,target=/home/root/app/target \
	cargo build --release
