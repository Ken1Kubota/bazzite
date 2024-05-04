#!/bin/bash

set -ouex pipefail

WORKDIR=/tmp/build/hid-fanatecff
cd ${WORKDIR}
git clone https://github.com/gotzl/hid-fanatecff.git ${WORKDIR}/hid-fanatecff

mkdir -p ${WORKDIR}/lib/modules/$(cat /tmp/kernel-version.txt)/build
cp -R /lib/modules/$(cat /tmp/kernel-version.txt)/build/* ${WORKDIR}/lib/modules/$(cat /tmp/kernel-version.txt)/build/

cp /sys/kernel/btf/vmlinux ${WORKDIR}/lib/modules/$(cat /tmp/kernel-version.txt)/build/

patch -u ${WORKDIR}/hid-fanatecff/Makefile < ${WORKDIR}/Makefile.patch
patch -u ${WORKDIR}/lib/modules/$(cat /tmp/kernel-version.txt)/build/scripts/Makefile.modfinal < ${WORKDIR}/Makefile.modfinal.patch

make -C ${WORKDIR}/hid-fanatecff clean
make -C ${WORKDIR}/hid-fanatecff
xz -k ${WORKDIR}/hid-fanatecff/hid-fanatec.ko

cp ${WORKDIR}/hid-fanatecff/hid-fanatec.ko.xz /lib/modules/$(cat /tmp/kernel-version.txt)/kernel/drivers/hid/
cp ${WORKDIR}/hid-fanatecff/fanatec.rules /usr/lib/udev/rules.d/99-fanatec.rules

cat << "EOF" > /etc/systemd/system/fanatec.service
[Unit]
Description=Fanatec Driver
After=network.target

[Service]
Type=oneshot
RemainAfterExit=yes
ExecStart=/sbin/modprobe hid-fanatec
ExecStop=/sbin/rmmod hid-fanatec

[Install]
WantedBy=multi-user.target
EOF

systemctl enable fanatec.service
