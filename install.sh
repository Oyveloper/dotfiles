#!/bin/sh
cd 
sudo apt install emacs stow wget curl zsh nitrogen pavucontrol compton rofi playerctl xclip

sudo add-apt-repository ppa:kgilmer/speed-ricer
sudo apt-get update
sudo apt-get install i3-gaps

sudo apt-get install \
  cmake cmake-data libcairo2-dev libxcb1-dev libxcb-ewmh-dev \
  libxcb-icccm4-dev libxcb-image0-dev libxcb-randr0-dev \
  libxcb-util0-dev libxcb-xkb-dev pkg-config python3-xcbgen \
  xcb-proto libxcb-xrm-dev libasound2-dev libmpdclient-dev \
  libiw-dev libcurl4-openssl-dev libpulse-dev \
  libxcb-composite0-dev xcb libxcb-ewmh2

git clone https://github.com/jaagr/polybar.git
cd polybar
./build.sh

cd
git clone https://github.com/plexus/chemacs.git
cd chemacs
./install.sh
cd 

git clone https://github.com/hlissner/doom-emacs .emacs.doom.d
.emacs.doom.d/bin/doom install



chsh -s $(which zsh)
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone https://github.com/denysdovhan/spaceship-prompt.git "$ZSH_CUSTOM/themes/spaceship-prompt"
ln -s "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH_CUSTOM/themes/spaceship.zsh-theme"
