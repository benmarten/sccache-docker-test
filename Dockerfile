# syntax=docker/dockerfile:experimental
from rust

ENV HOME=/home/root

WORKDIR $HOME/app

ADD src src
ADD Cargo.lock .
ADD Cargo.toml .

RUN --mount=type=cache,target=/usr/local/cargo/registry \
	--mount=type=cache,target=/home/root/app/target \
	cargo build --release
