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

curl -Lo /etc/yum.repos.d/_copr_solopasha_hyprland.repo https://copr.fedorainfracloud.org/coprs/solopasha/hyprland/repo/fedora-${RELEASE}/solopasha-hyprland-fedora-${RELEASE}.repo 
curl -Lo /etc/yum.repos.d/_copr_en4aew_desktop-tools.repo https://copr.fedorainfracloud.org/coprs/en4aew/desktop-tools/repo/fedora-${RELEASE}/en4aew-desktop-tools-fedora-${RELEASE}.repo 
curl -Lo /etc/yum.repos.d/_copr_alebastr_sway-extras.repo https://copr.fedorainfracloud.org/coprs/alebastr/sway-extras/repo/fedora-${RELEASE}/alebastr-sway-extras-fedora-${RELEASE}.repo 
curl -Lo /etc/yum.repos.d/_copr_erikreider_SwayNotificationCenter.repo https://copr.fedorainfracloud.org/coprs/erikreider/SwayNotificationCenter/repo/fedora-${RELEASE}/erikreider-SwayNotificationCenter-fedora-${RELEASE}.repo 
curl -Lo /etc/yum.repos.d/enpass-yum.repo https://yum.enpass.io/enpass-yum.repo

rpm-ostree install \
    dwarves \
    patch \
    htop \
    tldr \
    zoxide \
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
    meson \
    enpass

# sddm
rpm-ostree install \
    sddm \
    sddm-themes \
    qt5-qtgraphicaleffects \
    qt5-qtquickcontrols2 \
    qt5-qtsvg \

# launcher
rpm-ostree install \
    rofi-wayland

# environment
rpm-ostree install \
    xorg-x11-server-Xwayland \
    polkit \
    lxpolkit \
    xdg-user-dirs \
    dbus-tools \
    dbus-daemon \
    wl-clipboard \
    gnome-keyring \
    pavucontrol \
    playerctl \
    qt5-qtwayland \
    qt6-qtwayland \
    vulkan-validation-layers \
    vulkan-tools \
    google-noto-emoji-fonts \
    gnome-disk-utility \
    ImageMagick
  
# sound
rpm-ostree install \
    wireplumber \
    pipewire \
    pamixer

# networking
rpm-ostree install \
    network-manager-applet \
    NetworkManager-openvpn \
    NetworkManager-openconnect \
    bluez \
    bluez-tools \
    blueman

# file manager
rpm-ostree install \
    thunar \
    thunar-archive-plugin \
    thunar-volman \
    xarchiver \
    imv \
    p7zip \
    unrar-free

# screenshot
rpm-ostree install \
    slurp \
    grim

# display
rpm-ostree install \
    wlr-randr \
    wlsunset \
    brightnessctl \
    swaylock \
    swayidle \
    kanshi

# terminal
rpm-ostree install \
    kitty


# snapshot
rpm-ostree install \
    swappy

# notifications
rpm-ostree install \
    SwayNotificationCenter

# theme and GUI
rpm-ostree install \
    adwaita-qt5 \
    fontawesome-fonts-all \
    gnome-themes-extra \
    gnome-icon-theme \
    paper-icon-theme \
    breeze-icon-theme \
    papirus-icon-theme

# hyprland
rpm-ostree install \
    hyprland \
    waybar \
    wlogout \
    xdg-desktop-portal-hyprland

# copr
rpm-ostree install \
    aylurs-gtk-shell \
    cliphist \
    hypridle \
    hyprlock \
    pamixer \
    pyprland \
    swww

rm /etc/yum.repos.d/_copr_solopasha_hyprland.repo
rm /etc/yum.repos.d/_copr_en4aew_desktop-tools.repo
rm /etc/yum.repos.d/_copr_alebastr_sway-extras.repo
rm /etc/yum.repos.d/_copr_erikreider_SwayNotificationCenter.repo
rm /etc/yum.repos.d/enpass-yum.repo

