#!/bin/bash

#nvutils
#flatpak install flathub com.leinardi.gwe for only X11
#560.28 not stable###sudo dnf in https://koji.rpmfusion.org/kojifiles/packages/nvidia-kmod/560.28.03/1.fc41/x86_64/akmod-nvidia-560.28.03-1.fc41.x86_64.rpm https://koji.rpmfusion.org/kojifiles/packages/xorg-x11-drv-nvidia/560.28.03/1.fc41/i686/xorg-x11-drv-nvidia-cuda-libs-560.28.03-1.fc41.i686.rpm https://koji.rpmfusion.org/kojifiles/packages/xorg-x11-drv-nvidia/560.28.03/1.fc41/i686/xorg-x11-drv-nvidia-libs-560.28.03-1.fc41.i686.rpm https://koji.rpmfusion.org/kojifiles/packages/xorg-x11-drv-nvidia/560.28.03/1.fc41/x86_64/xorg-x11-drv-nvidia-560.28.03-1.fc41.x86_64.rpm https://koji.rpmfusion.org/kojifiles/packages/xorg-x11-drv-nvidia/560.28.03/1.fc41/x86_64/xorg-x11-drv-nvidia-cuda-560.28.03-1.fc41.x86_64.rpm https://koji.rpmfusion.org/kojifiles/packages/xorg-x11-drv-nvidia/560.28.03/1.fc41/x86_64/xorg-x11-drv-nvidia-cuda-libs-560.28.03-1.fc41.x86_64.rpm https://koji.rpmfusion.org/kojifiles/packages/xorg-x11-drv-nvidia/560.28.03/1.fc41/x86_64/xorg-x11-drv-nvidia-kmodsrc-560.28.03-1.fc41.x86_64.rpm https://koji.rpmfusion.org/kojifiles/packages/xorg-x11-drv-nvidia/560.28.03/1.fc41/x86_64/xorg-x11-drv-nvidia-libs-560.28.03-1.fc41.x86_64.rpm https://koji.rpmfusion.org/kojifiles/packages/xorg-x11-drv-nvidia/560.28.03/1.fc41/x86_64/xorg-x11-drv-nvidia-power-560.28.03-1.fc41.x86_64.rpm https://koji.rpmfusion.org/kojifiles/packages/nvidia-persistenced/560.28.03/1.fc41/x86_64/nvidia-persistenced-560.28.03-1.fc41.x86_64.rpm https://koji.rpmfusion.org/kojifiles/packages/nvidia-settings/560.28.03/1.fc41/x86_64/nvidia-settings-560.28.03-1.fc41.x86_64.rpm https://koji.rpmfusion.org/kojifiles/packages/nvidia-modprobe/560.28.03/1.fc41/x86_64/nvidia-modprobe-560.28.03-1.fc41.x86_64.rpm
#nvdriver 555.58
sudo dnf --enablerepo=rpmfusion-nonfree-updates-testing install akmod-nvidia xorg-x11-drv-nvidia-libs.i686
#
flatpak install org.freedesktop.Platform.GL.nvidia-555-58-02
####nvidia-kms
sudo cp nvidia-kms.conf /etc/modprobe.d/
