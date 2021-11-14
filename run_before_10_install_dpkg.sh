#!/bin/bash

set -o errexit
set -o nounset

PACKAGES="curl git"

PACKAGES+=" xz-utils"

PACKAGES+=" fish"

PACKAGES+=" powerline powerline-gitstatus"

#PACKAGES+=" rust-all"

sudo -v

sudo apt-get update

for i in ${PACKAGES}; do
    sudo apt-get install -y "${i}"
done
