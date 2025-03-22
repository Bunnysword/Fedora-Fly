#!/bin/bash

#configs
mkdir ~/.config/OpenRGB && wget https://github.com/Bunnysword/Confiles/raw/refs/heads/main/conf/1.orp && mv 1.orp ~/.config/OpenRGB/
mkdir ~/.config/fastfetch && wget https://raw.githubusercontent.com/Bunnysword/Confiles/refs/heads/main/conf/config.jsonc && mv config.jsonc ~/.config/fastfetch/
mkdir ~/.config/MangoHud && wget https://raw.githubusercontent.com/Bunnysword/Confiles/refs/heads/main/conf/MangoHud.conf && mv MangoHud.conf ~/.config/MangoHud/
#mkdir ~/.steam/ ~/.steam/steam/ && wget https://raw.githubusercontent.com/Bunnysword/Confiles/refs/heads/main/conf/steam_dev.cfg && mv steam_dev.cfg ~/.steam/steam/
wget https://raw.githubusercontent.com/Bunnysword/Confiles/refs/heads/main/conf/environment && sudo mv environment /etc
wget https://raw.githubusercontent.com/Bunnysword/Confiles/refs/heads/main/conf/nvidia-kms.conf && sudo mv nvidia-kms.conf /etc/modprobe.d/
mkdir -p ~/.config/pipewire/pipewire.conf.d && wget https://raw.githubusercontent.com/Bunnysword/Confiles/refs/heads/main/conf/10-no-resampling.conf && mv 10-no-resampling.conf ~/.config/pipewire/pipewire.conf.d/
wget https://raw.githubusercontent.com/Bunnysword/Confiles/refs/heads/main/conf/10-sound.conf && mv 10-sound.conf ~/.config/pipewire/pipewire.conf.d/
wget https://raw.githubusercontent.com/Bunnysword/Confiles/refs/heads/main/conf/.bash_profile && mv .bash_profile ~/

mkdir ~/.config/fish && wget https://raw.githubusercontent.com/Bunnysword/Confiles/refs/heads/main/conf/config.fish && mv config.fish ~/.config/fish/
mkdir ~/.config/fish/functions/ && wget https://raw.githubusercontent.com/Bunnysword/Confiles/refs/heads/main/conf/fish_prompt.fish && mv fish_prompt.fish ~/.config/fish/functions/

#Services
wget https://raw.githubusercontent.com/Bunnysword/Confiles/refs/heads/main/services/wakeup-disable_GPP0.service
sudo cp wakeup-disable_GPP0.service /etc/systemd/system/ && sudo systemctl enable wakeup-disable_GPP0.service
sudo systemctl start wakeup-disable_GPP0.service #B550 fix

#Autostart
mv autostart/  ~/.config 

#zapret
wget https://raw.githubusercontent.com/Bunnysword/Confiles/refs/heads/main/zapretcon/zapret.sh && chmod 750 zapret.sh && ./zapret.sh
