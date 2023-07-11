#!/bin/bash

# GIT
sudo pacman -S git
git config --global user.name "Jannis Isensee"
git config --global user.email ""
git config --global pull.rebase true

ssh-keygen -t ed25519

# YAY
git clone https://aur.archlinux.org/yay-bin.git ~/yay
cd yay
makepkg -si
cd ..
rm -rf yay
yay -Y --gendb --noconfirm
yay -Syu --devel --noconfirm
yay -Y --devel --save --noconfirm

# PACKAGES
yay -S --noconfirm man xclip zsh neovim picom tree feh polybar \
  zsh-syntax-highlighting zsh-autosuggestions wezterm xorg-xrandr autorandr \
  pavucontrol xorg-xlsfonts gnome-screenshot libreoffice-fresh nvm \
  docker docker-compose zsh-history-substring-search btop entr nerd-fonts-fira-code \
  noto-fonts-emoji rofi tldr autojump-rs neofetch firefox ttf-firacode-nerd

sudo chmod +x /usr/share/nvm/init-nvm.sh
./usr/share/nvm/init-nvm.sh

# DOCKER
sudo groupadd docker
sudo usermod -aG docker $USER

systemctl enable docker.service
systemctl enable containerd.service
systemctl start docker

# ZSH
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:=$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

# DOTFILES
mkdir ~/dotfiles

git clone --bare https://github.com/jisensee/dotfiles.git ~/dotfiles

rm ~/.zshrc

git --git-dir=$HOME/dotfiles --work-tree=$HOME checkout
git --git-dir=$HOME/dotfiles --work-tree=$HOME remote set-url origin git@github.com:jisensee/dotfiles.git
