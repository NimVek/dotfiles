#!/bin/bash

set -o errexit
set -o nounset

PACKAGES="curl git"

sudo -v

for i in ${PACKAGES}; do
    sudo apt install -y "${i}"
done
