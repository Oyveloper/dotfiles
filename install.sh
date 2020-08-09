#!/bin/sh
cd 

# Installing some basic packages
sudo apt install emacs vim stow wget curl zsh nitrogen \
  pavucontrol compton rofi playerctl xclip silversearcher-ag xdotool \
  neofetch libnotify screenfetch lolcat cowsay alacritty dunst \
  lightdm-gtk-greeter slick-greeter htop blueman compton

# Installing i3
sudo add-apt-repository ppa:kgilmer/speed-ricer
sudo apt-get update
sudo apt-get install i3wm
cd i3-radius && sh build.sh
cd

# Lots of dependencies for polybar
sudo apt-get install \
  cmake cmake-data libcairo2-dev libxcb1-dev libxcb-ewmh-dev \
  libxcb-icccm4-dev libxcb-image0-dev libxcb-randr0-dev \
  libxcb-util0-dev libxcb-xkb-dev pkg-config python3-xcbgen \
  xcb-proto libxcb-xrm-dev libasound2-dev libmpdclient-dev \
  libiw-dev libcurl4-openssl-dev libpulse-dev \
  libxcb-composite0-dev xcb libxcb-ewmh2

# Installing polybar
git clone https://github.com/jaagr/polybar.git
cd polybar
./build.sh
cd

# Chemacs for multiple emacs configs concurrently
git clone https://github.com/plexus/chemacs.git
cd chemacs
./install.sh
cd 

# Installing doom emacs
git clone https://github.com/hlissner/doom-emacs .emacs.doom.d
.emacs.doom.d/bin/doom install



# Changing the default shell and insstalling oh-my-zsh
chsh -s $(which zsh)
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone https://github.com/denysdovhan/spaceship-prompt.git "$ZSH_CUSTOM/themes/spaceship-prompt"
ln -s "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH_CUSTOM/themes/spaceship.zsh-theme"
