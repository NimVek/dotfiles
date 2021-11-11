#!/bin/bash

set -o errexit
set -o nounset

PACKAGES="powerline asdf"

curl https://raw.githubusercontent.com/oh-my-fish/oh-my-fish/master/bin/install | fish /dev/stdin --noninteractive --yes

fish -c "omf update"
for i in ${PACKAGES}; do
    fish -c "omf install ${i}"
done