#!/bin/bash

set -ouex pipefail

RELEASE="$(rpm -E %fedora)"


### Install packages

# Packages can be installed from any enabled yum repo on the image.
# RPMfusion repos are available by default in ublue main images
# List of rpmfusion packages can be found here:
# https://mirrors.rpmfusion.org/mirrorlist?path=free/fedora/updates/39/x86_64/repoview/index.html&protocol=https&redirect=1

# this installs a package from fedora repos
# rpm-ostree install screen

# this would install a package from rpmfusion
# rpm-ostree install vlc

#### Example for enabling a System Unit File

# systemctl enable podman.socket

rpm-ostree install \
    dwarves \
    patch \
    htop \
    tldr \
    im-chooser \
    fcitx5 \
    fcitx5-anthy \
    fcitx5-configtool \
    fcitx5-mozc \
    onedrive \
    python3-distutils-extra \
    python3-matplotlib-gtk3 \
    python3-scipy \
    python3-qt5 \
    meson
