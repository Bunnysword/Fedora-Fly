#!/bin/bash

#configs
mkdir ~/.config/OpenRGB && wget https://github.com/Bunnysword/Confiles/raw/refs/heads/main/conf/1.orp && mv 1.orp ~/.config/OpenRGB/
mkdir ~/.config/fastfetch && wget https://raw.githubusercontent.com/Bunnysword/Confiles/refs/heads/main/conf/config.jsonc && mv config.jsonc ~/.config/fastfetch/
mkdir ~/.config/MangoHud && wget https://raw.githubusercontent.com/Bunnysword/Confiles/refs/heads/main/conf/MangoHud.conf && mv MangoHud.conf ~/.config/MangoHud/
#mkdir ~/.steam/ ~/.steam/steam/ && wget https://raw.githubusercontent.com/Bunnysword/Confiles/refs/heads/main/conf/steam_dev.cfg && mv steam_dev.cfg ~/.steam/steam/
wget https://raw.githubusercontent.com/Bunnysword/Confiles/refs/heads/main/conf/environment && sudo mv environment /etc
wget https://raw.githubusercontent.com/Bunnysword/Confiles/refs/heads/main/conf/nvidia-kms.conf && sudo mv nvidia-kms.conf /etc/modprobe.d/

#Services
wget https://raw.githubusercontent.com/Bunnysword/Confiles/refs/heads/main/services/wakeup-disable_GPP0.service
sudo cp wakeup-disable_GPP0.service /etc/systemd/system/ && sudo systemctl enable wakeup-disable_GPP0.service
sudo systemctl start wakeup-disable_GPP0.service #B550 fix
#wget https://raw.githubusercontent.com/Bunnysword/Confiles/refs/heads/main/services/noisetorch.service
#mv noisetorch.service ~/.config/systemd/user/
#systemctl --user daemon-reload && systemctl --user start noisetorch && systemctl --user enable noisetorch #noisetorch

#Autostart
mv autostart/  ~/.config 
#&& wget https://github.com/xvzc/SpoofDPI/releases/download/v0.12.0/spoofdpi-linux-amd64.tar.gz && tar -xzvf spoofdpi-linux-amd64.tar.gz && sudo mv spoofdpi /usr/local/
#? git clone https://github.com/JustTemmie/steam-presence && mv config.json steam-presence/ && cd steam-presence/ && ./installer.sh && cd ..
