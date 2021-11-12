#!/bin/bash

set -o errexit
set -o nounset

FISH_BIN=$(command -v fish)

if [[ -n "${FISH_BIN}" ]]; then
    CURRENT_SHELL=$(getent passwd "${USER}" | cut -d : -f 7)
    if [[ "${FISH_BIN}" != "${CURRENT_SHELL}" ]]; then
        echo "Changeing Login-Shell from ${CURRENT_SHELL} to ${FISH_BIN}"
        chsh --shell "${FISH_BIN}"
    fi
fi
