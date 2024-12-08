#!/bin/bash
cd .. && mv Fedora-Fly/ .config/ && cd .config/Fedora-Fly/
sudo sh -c "echo -e 'fastestmirror=True\nmax_parallel_downloads=10\ndefaultyes=True\nkeepcache=True' >> /etc/dnf/dnf.conf"
sudo dnf autoremove -y && sudo dnf clean all && sudo dnf in dnf5-plugin-automatic --allowerasing && systemctl enable dnf-automatic.timer

sudo dnf in -y https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
sudo dnf in -y rpmfusion-free-appstream-data rpmfusion-nonfree-appstream-data

sudo dnf in -y gstreamer1-plugins-{bad-\*,good-\*,base} gstreamer1-plugin-openh264 gstreamer1-libav --exclude=gstreamer1-plugins-bad-free-devel
sudo dnf in -y lame\* --exclude=lame-devel && sudo dnf group upgrade -y Multimedia --with-optional --allowerasing
sudo dnf groupupdate -y multimedia --setop="install_weak_deps=False" --exclude=PackageKit-gstreamer-plugin && sudo dnf groupupdate -y sound-and-video

sudo dnf config-manager --add-repo https://terra.fyralabs.com/terra.repo && sudo dnf in -y discord #Discord Terra
sudo dnf in -y papirus-icon-theme #Papirus icons

sudo dnf in -y steam kdenlive mpv htop redhat-lsb-core inxi fastfetch openrgb nvtop transmission-qt --allowerasing

sudo dnf update -y --refresh

flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
flatpak install flathub -y com.obsproject.Studio portproton net.davidotek.pupgui2 org.telegram.desktop

sudo dnf copr enable -y codifryed/CoolerControl && sudo dnf in -y coolercontrol && sudo systemctl enable --now coolercontrold
#NVIDIA
sudo dnf in akmod-nvidia xorg-x11-drv-nvidia-libs.i686 xorg-x11-drv-nvidia-cuda-libs.i686 --enablerepo=rpmfusion-nonfree-updates-testing

chmod 750 configurations.sh && ./configurations.sh
