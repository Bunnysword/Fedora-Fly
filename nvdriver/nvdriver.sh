#!/bin/bash

#nvutils
#sudo dnf --enablerepo=rpmfusion-nonfree-updates-testing install akmod-nvidia-open xorg-x11-drv-nvidia-libs.i686 xorg-x11-drv-nvidia-cuda-libs.i686
sudo dnf in akmod-nvidia xorg-x11-drv-nvidia-libs.i686 xorg-x11-drv-nvidia-cuda-libs.i686
#flatpak install -y org.freedesktop.Platform.GL.nvidia-560-35-03
####nvidia-kms
sudo cp nvidia-kms.conf /etc/modprobe.d/
