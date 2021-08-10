export ZSH="/home/jannis/.oh-my-zsh"

ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=(
  git
  ssh-agent
  vi-mode
  docker
  docker-compose
  gradle
  last-working-dir
  nvm
  sudo
  zsh-syntax-highlighting
  zsh-autosuggestions
  fzf
 ) 

source $ZSH/oh-my-zsh.sh

# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi


# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# CTRL + Space to accept autosuggestion
bindkey '^ ' autosuggest-accept

# DIRCOLORS
eval `dircolors ~/.dir_colors`

# ENV
export PATH=$PATH:/snap/bin:/var/lib/snapd/snap/bin:~/tools
export SHELL=/bin/zsh
export EDITOR=nvim

# DOCKER
alias d='docker'
alias ds='docker service'
alias dsl='docker service ls --format "table {{.Name}}\t{{.Replicas}}\t{{.Image}}\t{{.Ports}}"'
alias dsu='docker service update --force'
alias dps='docker ps --format "table {{.ID}}\t{{printf \"%.25s\" .Names}}\t{{.Status}}\t{{.Ports}}"'
alias dvl='docker volume ls'
alias dvp='docker volume prune -f'
alias db='docker build . -t'
dl() {
  docker logs -f $(docker ps -qf "name=$1")
}
dpsf() {
  dps -f "name=$1"
}
dshell() {
  docker exec -i -t $(docker ps -qf "name=$1") bash
}

# GRADLE
alias gr='gradle-or-gradlew'
alias grt='gradle-or-gradlew test'
alias grtd='gradle-or-gradlew test --debug-jvm'
alias grtf='gradle-or-gradlew test --tests'
alias grtfd='gradle-or-gradlew test --debug-jvm --tests'
alias grc='gradle-or-gradlew clean'
alias grbo='gradle-or-gradlew build -x test'

# GIT
gfb() {
  git fetch origin $1:$1
}
alias glfs='git lfs'

# APPS
alias oni2='~/tools/Onivim2.AppImage'
alias oni='oni2'
b() {
  firefox $1 &
}
chrome() {
  google-chrome-stable $1 &;disown
}
alias top='htop'

# PAMAC
alias pm='pamac'
alias pmi='sudo pamac install --no-upgrade'
alias pms='pamac search'

# ZSH
alias zrc='v ~/.zshrc'
alias zrl='source ~/.zshrc'

# MEMES
alias yeet='rm -rf'
alias please='sudo'
alias fucking='sudo'
alias lol='lolcat'

# VIM
alias v='nvim'
alias vi='nvim'
alias vimrc='v ~/.config/nvim/init.vim'
alias vt='v -c "terminal"'

# OTHER
alias cbi='xclip -selection "clipboard"'
alias cbo='xclip -o -selection "clipboard"'
alias find-alias='alias | grep'
alias pjson='v package.json'
alias uuid='cat /proc/sys/kernel/random/uuid'
alias c='git --git-dir=$HOME/dotfiles --work-tree=$HOME'
alias cst='c status -uno'
alias cya='systemctl suspend-then-hibernate'

function cdl() {
  cd $1
  ll
}

# CUSTOM CONFIG
CUSTOM_DIR=~/zshrc-custom
if [[ -d $CUSTOM_DIR ]]
then
  for f in $CUSTOM_DIR/*; do
    source $f
  done
fi
