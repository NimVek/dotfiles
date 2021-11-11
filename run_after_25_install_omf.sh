#!/bin/bash

set -o errexit
set -o nounset

PACKAGES="powerline asdf rustup git-refresh"

INSTALLED=$(fish -c "omf --version" || true)

if [[ -z ${INSTALLED} ]]; then
    curl https://raw.githubusercontent.com/oh-my-fish/oh-my-fish/master/bin/install | fish /dev/stdin --noninteractive --yes
fi

for i in ${PACKAGES}; do
    fish -c "omf install ${i}" || true
done

fish -c "omf update"
