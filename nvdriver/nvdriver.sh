#!/bin/bash

#nvutils
#flatpak install flathub com.leinardi.gwe for only X11
#nvdriver 555.58
sudo dnf --enablerepo=rpmfusion-nonfree-updates-testing install akmod-nvidia xorg-x11-drv-nvidia-libs.i686
####nvidia-kms
sudo cp nvidia-kms.conf /etc/modprobe.d/
