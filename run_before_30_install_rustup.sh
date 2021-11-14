#!/bin/bash

set -o errexit
set -o nounset

PLUGINS="topgrade"

if ! command -v rustup >/dev/null 2>&1; then
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
fi

for i in ${PLUGINS}; do
    crago install "${i}"
done
