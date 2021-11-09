#!/bin/bash

set -o errexit
set -o nounset

FISH_BIN=$(command -v fish)

if [[ -n ${FISH_BIN} ]]; then
    chsh --shell "${FISH_BIN}"
fi
