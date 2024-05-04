#!/bin/bash

set -ouex pipefail

WORKDIR=/tmp/build/oversteer
cd ${WORKDIR}
git clone https://github.com/berarma/oversteer.git ${WORKDIR}/oversteer
cd oversteer

patch -u meson_options.txt < ${WORKDIR}/meson_options.txt.patch

meson  build --prefix /usr
cd build
ninja install
