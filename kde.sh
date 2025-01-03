#!/bin/bash

#configuration dnf
cd .. && mv Fedora-Fly/ .config/ && cd .config/Fedora-Fly/
sudo sh -c "echo -e 'fastestmirror=True\nmax_parallel_downloads=10\ndefaultyes=True\nkeepcache=True' >> /etc/dnf/dnf.conf"
sudo dnf autoremove -y && sudo dnf clean all && sudo dnf in -y dnf5-plugin-automatic --allowerasing && systemctl enable dnf-automatic.timer
#rpmfusion
sudo dnf in -y https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
sudo dnf in -y rpmfusion-free-appstream-data rpmfusion-nonfree-appstream-data
#gstreamer
sudo dnf in -y gstreamer1-plugins-{bad-\*,good-\*,base} gstreamer1-plugin-openh264 gstreamer1-libav --exclude=gstreamer1-plugins-bad-free-devel
#repos
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc && echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" | sudo tee /etc/yum.repos.d/vscode.repo > /dev/null
sudo dnf copr enable -y codifryed/CoolerControl
sudo dnf copr enable bieszczaders/kernel-cachyos
#appinstall
sudo dnf in -y mangohud steam kdenlive mpv htop redhat-lsb-core inxi fastfetch openrgb nvtop transmission-qt code coolercontrol ffmpeg --allowerasing
#update
sudo dnf install kernel-cachyos kernel-cachyos-devel-matched
sudo dnf update -y --refresh
#flatpak
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
flatpak install flathub -y com.obsproject.Studio net.davidotek.pupgui2 org.telegram.desktop dev.vencord.Vesktop
#disableservices
sudo systemctl mask plymouth-quit-wait.service
systemctl disable rpcbind.service
systemctl disable NetworkManager-wait-online.service
#nvidiadriver
sudo dnf in akmod-nvidia xorg-x11-drv-nvidia-libs.i686 xorg-x11-drv-nvidia-cuda-libs.i686
