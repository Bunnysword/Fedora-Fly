#!/bin/bash

#FOR_GNOME_F39+ by Bunny Sword
#configuration dnf
cd .. && mv Fedora-Fly/ .config/ && cd .config/Fedora-Fly/
sudo sh -c "echo -e 'fastestmirror=True\nmax_parallel_downloads=10\ndefaultyes=True\nkeepcache=True' >> /etc/dnf/dnf.conf"
sudo dnf autoremove -y && sudo dnf clean all && sudo dnf in -y dnf-automatic && systemctl enable dnf-automatic.timer
#rpmfusion
sudo dnf in -y https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
sudo dnf in -y rpmfusion-free-appstream-data rpmfusion-nonfree-appstream-data
#Codec and multimedia groups
sudo dnf in -y gstreamer1-plugins-{bad-\*,good-\*,base} gstreamer1-plugin-openh264 gstreamer1-libav --exclude=gstreamer1-plugins-bad-free-devel
sudo dnf in -y lame\* --exclude=lame-devel && sudo dnf group upgrade -y Multimedia --with-optional --allowerasing
sudo dnf groupupdate -y multimedia --setop="install_weak_deps=False" --exclude=PackageKit-gstreamer-plugin && sudo dnf groupupdate -y sound-and-video
#Other
sudo sed -i "13i exclude=kernel*" /etc/yum.repos.d/fedora-updates.repo && sudo dnf copr enable -y sentry/kernel-fsync #Fsync
sudo dnf copr enable -y principis/NoiseTorch && sudo dnf in -y noisetorch #Noisetorch
sudo dnf config-manager --add-repo https://terra.fyralabs.com/terra.repo && sudo dnf in -y discord #Discord Terra
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc && echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" | sudo tee /etc/yum.repos.d/vscode.repo > /dev/null
sudo dnf in -y code #VSC
sudo dnf in -y papirus-icon-theme #Papirus icons
if [ -n "$XDG_CURRENT_DESKTOP" ]; then
  case "$XDG_CURRENT_DESKTOP" in
    GNOME)
echo 'GNOME Tips'
sudo sed -i "6i AutomaticLoginEnable=True\nAutomaticLogin=bunnysword" /etc/gdm/custom.conf #autologin in GDM
gsettings set org.gnome.settings-daemon.plugins.media-keys volume-step 1
gsettings set org.gnome.desktop.interface gtk-theme 'Adwaita-dark' && gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark' && gsettings set org.gnome.desktop.interface icon-theme 'Papirus'
sudo dnf copr enable -y trixieua/mutter-patched
sudo firewall-cmd --zone=public --permanent --add-port=1714-1764/tcp && sudo firewall-cmd --zone=public --permanent --add-port=1714-1764/udp && sudo systemctl restart firewalld.service #GSCONNECT
sudo dnf rm -y mediawriter rhythmbox evince yelp gnome-characters gnome-logs gnome-tour gnome-photos gnome-maps gnome-weather gnome-font-viewer gnome-contacts gnome-clocks gnome-calendar gnome-boxes libreoffice* power-profiles-daemon
sudo dnf in -y transmission-gtk gnome-tweaks
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
flatpak install flathub -y com.mattjakeman.ExtensionManager
#EXTENSIONS
gnome-extensions disable background-logo@fedorahosted.org
      ;;
    KDE)
echo 'KDE Tips'
gsettings set org.gnome.desktop.interface gtk-theme 'Adwaita' && plasma-apply-colorscheme BreezeDark
sudo dnf rm -y kolourpaint mediawriter okular skanpage kmahjongg kmines kpat akregator kmail ktnef sieveeditor neochat contactprintthemeeditor contactthemeeditor pimdataexporter dragonplayer elisa kamoso korganizer kcharselect kmousetool
sudo dnf in -y transmission-qt
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
      ;;
  esac
fi
#Install_Apps
sudo dnf in -y timeshift goverlay steam kdenlive vlc htop redhat-lsb-core inxi fastfetch protontricks openssl discord noisetorch openrgb nvtop --allowerasing
sudo dnf update -y --refresh #Update
#Flatpak
flatpak install flathub -y com.obsproject.Studio portproton net.davidotek.pupgui2
#com.heroicgameslauncher.hgl
#Services
sudo systemctl mask plymouth-quit-wait.service && systemctl disable livesys-late.service && systemctl disable livesys.service && systemctl disable rpcbind.service && systemctl disable lvm2-monitor.service && systemctl disable NetworkManager-wait-online.service #Disable
chmod 750 conf.sh && ./conf.sh
#NVIDIAMOMENTO
cd nvdriver/ && chmod 750 nvdriver.sh && ./nvdriver.sh
####sudo grubby --args="gpu_sched.sched_policy=0" --update-kernel=ALL for amd wayland fix
####sudo mv conf/90-corectrl.rules /etc/polkit-1/rules.d/ #Corectrl rules for amd
####sudo mv conf/environment /etc && sudo dmesg | grep BAR= #BAR for amd
