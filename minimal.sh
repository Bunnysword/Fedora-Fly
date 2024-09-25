#!/bin/bash

#rpmfusion
sudo dnf in -y https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
sudo dnf in -y rpmfusion-free-appstream-data rpmfusion-nonfree-appstream-data
#Codec and multimedia groups
sudo dnf in -y gstreamer1-plugins-{bad-\*,good-\*,base} gstreamer1-plugin-openh264 gstreamer1-libav --exclude=gstreamer1-plugins-bad-free-devel
sudo dnf in -y lame\* --exclude=lame-devel && sudo dnf group upgrade -y Multimedia --with-optional --allowerasing
sudo dnf groupupdate -y multimedia --setop="install_weak_deps=False" --exclude=PackageKit-gstreamer-plugin && sudo dnf groupupdate -y sound-and-video
#Fsync
sudo sed -i "13i exclude=kernel*" /etc/yum.repos.d/fedora-updates.repo && sudo dnf copr enable -y sentry/kernel-fsync
#rm
sudo dnf rm -y mediawriter rhythmbox evince yelp gnome-characters gnome-logs gnome-tour gnome-photos gnome-maps gnome-weather gnome-font-viewer gnome-contacts gnome-clocks gnome-calendar gnome-boxes libreoffice* power-profiles-daemon
#in
sudo dnf in -y goverlay steam vlc htop redhat-lsb-core inxi fastfetch openrgb piper nvtop
#Update
sudo dnf update -y --refresh
#Conf
chmod 750 conf.sh && ./conf.sh
#NVIDIAMOMENTO
cd nvdriver/ && chmod 750 nvdriver.sh && ./nvdriver.sh
