#!/bin/sh -x

set -o errexit
set -o nounset

INSTALLER=https://git.io/chezmoi
SCRIPT_DIR=$(dirname -- "$0")

CHEZMOI=$(command -v chezmoi || true)

if [ -z "${CHEZMOI}" ]; then
    BIN_DIR="${HOME}/.local/bin"

    if command -v curl >/dev/null 2>&1; then
        DOWNLOADER='curl --fail --silent --show-error --location'
    elif command -v wget >/dev/null 2>&1; then
        DOWNLOADER='wget --quiet --output-document -'
    else
        echo "To install chezmoi, you must have curl or wget installed." >&2
        exit 1
    fi

    ${DOWNLOADER} "${INSTALLER}" | sh -s -- -b "${BIN_DIR}"
    CHEZMOI="${BIN_DIR}/chezmoi"
fi

exec "${CHEZMOI}" init --apply "--source=${SCRIPT_DIR}"
