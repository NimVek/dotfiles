#!/bin/bash

set -o errexit
set -o nounset

PLUGINS="shellcheck shfmt"

if ! command -v asdf >/dev/null 2>&1; then
    _ASDF_DIR="${HOME}/.asdf"
    _ASDF_BASH="${_ASDF_DIR}/asdf.sh"
    if [[ ! -r ${_ASDF_BASH} ]]; then
        rm -rf "${_ASDF_DIR}"
        git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.8.1
    fi

    # shellcheck source=/dev/null
    . "${_ASDF_BASH}"
fi

asdf update

for i in ${PLUGINS}; do
    asdf plugin add "${i}" || true
    asdf install "${i}" latest
    asdf global "${i}" latest
done

asdf update plugin --all
