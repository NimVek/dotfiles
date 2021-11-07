#!/bin/bash

set -o errexit
set -o nounset

PACKAGES="curl git"

PACKAGES+=" xz-utils"

sudo -v

for i in ${PACKAGES}; do
    sudo apt-get install -y "${i}"
done
