#!/bin/bash

set -o errexit
set -o nounset

PLUGINS="cargo-update topgrade"

if ! command -v rustup >/dev/null 2>&1; then
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y --no-modify-path --profile default
    export PATH="${HOME}/.cargo/bin:${PATH}"
fi

for i in ${PLUGINS}; do
    cargo install "${i}"
done
