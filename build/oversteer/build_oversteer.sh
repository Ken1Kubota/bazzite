#!/bin/bash

set -ouex pipefail

WORKDIR=/tmp/build/oversteer
export MESON_INSTALL_PREFIX=/usr
cd ${WORKDIR}
#git clone https://github.com/berarma/oversteer.git ${WORKDIR}/oversteer
git clone https://github.com/gotzl/oversteer.git ${WORKDIR}/oversteer
cd oversteer

patch -u meson_options.txt < ${WORKDIR}/meson_options.txt.patch
patch -u meson.build < ${WORKDIR}/meson.build.patch

meson  build --prefix /usr
cd build
ninja install
