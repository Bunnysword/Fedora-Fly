#!/bin/bash

#configuration dnf
cd .. && mv Fedora-Fly/ .config/ && cd .config/Fedora-Fly/
sudo sh -c "echo -e 'fastestmirror=True\nmax_parallel_downloads=10\ndefaultyes=True\nkeepcache=True' >> /etc/dnf/dnf.conf"
sudo dnf autoremove -y && sudo dnf clean all && sudo dnf in dnf5-plugin-automatic --allowerasing && systemctl enable dnf-automatic.timer
#rpmfusion
sudo dnf in -y https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
sudo dnf in -y rpmfusion-free-appstream-data rpmfusion-nonfree-appstream-data
#Codec and multimedia groups
sudo dnf in -y gstreamer1-plugins-{bad-\*,good-\*,base} gstreamer1-plugin-openh264 gstreamer1-libav --exclude=gstreamer1-plugins-bad-free-devel
#repos
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc && echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" | sudo tee /etc/yum.repos.d/vscode.repo > /dev/null
sudo dnf copr enable -y codifryed/CoolerControl
sudo dnf copr enable -y trixieua/mutter-patched
sudo dnf copr enable -y bieszczaders/kernel-cachyos
sudo dnf copr enable -y lizardbyte/stable
sudo dnf copr enable -y umutd3401/extension-manager
sudo dnf copr enable -y apicalshark/ProtonUp-Qt
#
sudo dnf in -y papirus-icon-theme #Papirus icons
sudo sed -i "6i AutomaticLoginEnable=True\nAutomaticLogin=bunnysword" /etc/gdm/custom.conf #autologin in GDM
gsettings set org.gnome.settings-daemon.plugins.media-keys volume-step 1
gsettings set org.gnome.desktop.interface gtk-theme 'Adwaita-dark' && gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark' && gsettings set org.gnome.desktop.interface icon-theme 'Papirus'
sudo firewall-cmd --zone=public --permanent --add-port=1714-1764/tcp && sudo firewall-cmd --zone=public --permanent --add-port=1714-1764/udp && sudo systemctl restart firewalld.service #GSCONNECT
#rmapp
sudo dnf rm -y mediawriter rhythmbox evince yelp gnome-characters gnome-logs gnome-tour gnome-photos gnome-maps gnome-weather gnome-font-viewer gnome-contacts gnome-clocks gnome-calendar gnome-boxes libreoffice*
#EXTENSIONS
gnome-extensions disable background-logo@fedorahosted.org
#Install_Apps timeshift goverlay noisetorch openrgb
sudo dnf in -y mangohud steam kdenlive mpv htop redhat-lsb-core inxi fastfetch openssl discord nvtop transmission-gtk gnome-tweaks code ffmpeg coolercontrol fish sunshine extension-manager protonup-qt libavcodec-freeworld --allowerasing
#Update
sudo dnf install -y kernel-cachyos kernel-cachyos-devel-matched
sudo grubby --set-default /boot/vmlinuz*cachyos*
sudo dnf update -y --refresh 
chsh -s $(which fish)
#Flatpak portproton
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
flatpak install flathub -y com.obsproject.Studio org.telegram.desktop
#Services
sudo systemctl mask plymouth-quit-wait.service && systemctl disable livesys-late.service && systemctl disable rpcbind.service && systemctl disable lvm2-monitor.service && systemctl disable NetworkManager-wait-online.service #Disable
systemctl --user mask org.gnome.SettingsDaemon.Wacom.service && systemctl --user mask org.gnome.SettingsDaemon.PrintNotifications.service && systemctl --user mask org.gnome.SettingsDaemon.Color.service && systemctl --user mask org.gnome.SettingsDaemon.A11ySettings.service
systemctl --user mask org.gnome.SettingsDaemon.UsbProtection.service && systemctl --user mask org.gnome.SettingsDaemon.Sharing.service && systemctl --user mask org.gnome.SettingsDaemon.Smartcard.service
#NVIDIA
sudo dnf in -y akmod-nvidia xorg-x11-drv-nvidia-libs.i686 xorg-x11-drv-nvidia-cuda-libs.i686 nvidia-vaapi-driver xorg-x11-drv-nvidia-cuda xorg-x11-drv-nvidia-cuda-libs
sudo grubby --args="rd.driver.blacklist=nouveau" --update-kernel=ALL

#conf for gnome
mkdir ~/.config/fastfetch && wget https://raw.githubusercontent.com/Bunnysword/Confiles/refs/heads/main/conf/fedora-gnome/config.jsonc && mv config.jsonc ~/.config/fastfetch/

