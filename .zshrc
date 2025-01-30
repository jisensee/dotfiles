export ZSH="/home/jannis/.oh-my-zsh"

export KUBECONFIG=~/.kube/context.yaml:$(ls ~/.kube | grep .yaml | grep -v context.yaml | sed 's|^|'"$HOME"'/.kube/|' | tr '\n' ':' | sed 's/:$//')

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
  history-substring-search
  sudo
  virtualenv
  web-search
  direnv
 ) 

source $ZSH/oh-my-zsh.sh

source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh

# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# This speeds up pasting w/ autosuggest
# https://github.com/zsh-users/zsh-autosuggestions/issues/238
pasteinit() {
  OLD_SELF_INSERT=${${(s.:.)widgets[self-insert]}[2,3]}
  zle -N self-insert url-quote-magic # I wonder if you'd need `.url-quote-magic`?
}

pastefinish() {
  zle -N self-insert $OLD_SELF_INSERT
}
zstyle :bracketed-paste-magic paste-init pasteinit
zstyle :bracketed-paste-magic paste-finish pastefinish

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# CTRL + Space to accept autosuggestion
bindkey '^ ' autosuggest-accept

# DIRCOLORS
eval `dircolors ~/.dir_colors`

# ENV
export PATH=$PATH:~/tools:~/.local/bin:/usr/share/nvm

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
bp() {
  firefox --private-window $1 &
}
chrome() {
  google-chrome-stable $1 &;disown
}
alias top='btop'

# PACKAGE MANAGER
alias pm='yay'
alias pmi='yay -S'
alias pms='yay -Ss'
alias pminfo='yay -Si'
alias pmup='yay -Syu'

# ZSH
alias zrc='v ~/.zshrc'
alias zrl='source ~/.zshrc'

# MEMES
alias yeet='rm -rf'
alias please='sudo'
alias fucking='sudo'
alias lol='lolcat'

# VIM
alias v='env TERM=wezterm nvim'
alias vi='v'
alias vimrc='v ~/.config/nvim/init.vim'
alias vt='v -c "terminal"'

# TMUX
alias t='tmux'
alias tl='tmux ls'
alias ta='tmux attach'
alias td='tmux detach'

# DEV
alias jt='b build/reports/tests/test/index.html &'
alias jcc='b build/reports/jacoco/test/html/index.html &'

# SYSTEM
alias cya='systemctl suspend-then-hibernate'
alias gn='systemctl hibernate'
alias brb='sudo reboot'
alias bb='sudo shutdown now'
alias ff='fastfetch'
alias s='systemctl'

# YARn
alias y='yarn'
alias yt='yarn test'

# KEYBOARD LAYOUTS
alias kb-q='setxkbmap us,us'
alias kb-d='setxkbmap -layout us,us -variant dvorak,dvorak'

# OTHER
alias cbi='xclip -selection "clipboard"'
alias cbo='xclip -o -selection "clipboard"'
alias find-alias='alias | grep'
alias search-history='history | grep'
alias pjson='v package.json'
alias uuid='cat /proc/sys/kernel/random/uuid'
alias c='git --git-dir=$HOME/dotfiles --work-tree=$HOME'
alias cst='c status -uno'

alias 'glo'='git log --grep "chore(release)" --invert-grep --no-merges --oneline'

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

# bun completions
[ -s "/home/jannis/.bun/_bun" ] && source "/home/jannis/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# asdf
# . /opt/asdf-vm/asdf.sh
# . "/home/jannis/.starkli/env"
