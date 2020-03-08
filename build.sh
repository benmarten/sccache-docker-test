#!/bin/sh

# Start sccache.
sccache --start-server
sccache --show-stats

# Build & fill cache.
cargo build --release
sccache --show-stats

# Clear cargo cache & rebuild, using cache.
rm -rf target
cargo build --release
sccache --show-stats
