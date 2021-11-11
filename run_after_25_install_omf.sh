#!/bin/bash

set -o errexit
set -o nounset

curl https://raw.githubusercontent.com/oh-my-fish/oh-my-fish/master/bin/install | fish /dev/stdin --verbose --noninteractive --yes
