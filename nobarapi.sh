#!/bin/bash

#Nobara post install
sudo dnf config-manager --add-repo https://terra.fyralabs.com/terra.repo && sudo dnf in -y discord
sudo dnf copr enable -y principis/NoiseTorch && sudo dnf in -y noisetorch
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc && echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" | sudo tee /etc/yum.repos.d/vscode.repo > /dev/null
sudo dnf in -y code #VSC
sudo dnf in -y papirus-icon-theme
sudo dnf rm -y elisa kmousetool kcharselect kamoso neochat skanpage okular mediawriter 
sudo dnf in -y transmission-qt
flatpak install flathub -y portproton
sudo cp services/wakeup-disable_GPP0.service /etc/systemd/system/ && sudo systemctl enable wakeup-disable_GPP0.service && sudo systemctl start wakeup-disable_GPP0.service #B550 fix
mkdir /home/bunnysword/.config/systemd/ && mkdir /home/bunnysword/.config/systemd/user && mv services/noisetorch.service /home/bunnysword/.config/systemd/user/ && systemctl --user daemon-reload && systemctl --user start noisetorch && systemctl --user enable noisetorch #noisetorch
mkdir /home/bunnysword/.config/OpenRGB && mv conf/1.orp /home/bunnysword/.config/OpenRGB/ #OpenRGB profile
mkdir /home/bunnysword/.config/MangoHud && mv conf/MangoHud.conf /home/bunnysword/.config/MangoHud/ #MangoHud
sudo mv conf/environment /etc
git clone https://github.com/JustTemmie/steam-presence && mv conf/config.json steam-presence/ && cd steam-presence/ && ./installer.sh && cd ..
