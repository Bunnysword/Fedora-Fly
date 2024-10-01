#!/bin/bash

mv conf/Spoofdpi.desktop ~/.config/autostart/ && wget https://github.com/xvzc/SpoofDPI/releases/download/v0.12.0/spoofdpi-linux-amd64.tar.gz && sudo mv spoofdpi /usr/local/
mkdir ~/.config/OpenRGB && mv conf/1.orp ~/.config/OpenRGB/ #OpenRGB profile
mkdir ~/.config/fastfetch && mv conf/config.jsonc ~/.config/fastfetch/ && fastfetch #fastfetch conf
mkdir ~/.config/MangoHud && mv conf/MangoHud.conf ~/.config/MangoHud/ #MangoHud
sudo mv conf/environment /etc
mkdir ~/.steam/ && mkdir ~/.steam/steam/ && mv conf/steam_dev.cfg ~/.steam/steam/ #steam tips
sudo cp services/wakeup-disable_GPP0.service /etc/systemd/system/ && sudo systemctl enable wakeup-disable_GPP0.service && sudo systemctl start wakeup-disable_GPP0.service #B550 fix
git clone https://github.com/JustTemmie/steam-presence && mv conf/config.json steam-presence/ && cd steam-presence/ && ./installer.sh && cd ..
