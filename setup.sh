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
yay -Y --gendb
yay -Syu --devel
yay -Y --devel --save

# PACKAGES
yay -S --noconfirm man xclip zsh neovim picom tree feh polybar ttf-meslo-nerd-font-powerlevel10k \
  zsh-syntaxt-highlighting zsh-autosuggestions ttf-fira-code alacritty xorg-xrandr autorandr \
  pavucontrol i3-easyfocus xorg-xlsfonts gnome-screenshot libreoffice-fresh visual-studio-code-bin nvm \
  docker docker-compose zsh-history-substring-search btop tmux tmux-plugin-manager entr nerd-fonts-fira-code noto-fonts-emoji python-libtmux rofi

# DOCKER
sudo groupadd docker
sudo usermod -aG docker $USER

systemctl enable docker.service
systemctl enable containerd.service
systemctl start docker

# DOTFILES
mkdir ~/dotfiles

git clone --bare git@github.com:jisensee/dotfiles.git ~/dotfiles
alias config='git --git-dir=$HOME/dotfiles --work-tree=$HOME'

rm ~/.config/.i3/config

config checkout

# ZSH
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:=$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
