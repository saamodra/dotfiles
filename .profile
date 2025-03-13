export EDITOR="nvim"
export BROWSER="microsoft-edge"
export MYVIMRC="$HOME/.config/nvim/init.lua"

alias gdcn!="git duet-commit --amend --no-edit"
alias gdc="git duet-commit"
alias gamend='git commit --amend --no-edit'
alias port-killer="$HOME/scripts/port-killer.sh"
alias rg="pipx run --spec ranger-fm ranger"
alias wa="watch"
alias dcstop="~/scripts/docker-stop.sh"
alias kg="k get"
alias kd="k describe"

alias docker-compose='docker compose'
alias build-vidio='docker-compose run --rm web yarn build:fast'
alias build-lite='docker-compose run --rm vidio-lite yarn build'
alias build-all='build-lite && build-vidio'
alias dc='docker-compose'
alias dcrm='dc run --rm --use-aliases --service-ports'
alias gcof="git checkout \$(git branch -a | sed 's#remotes/origin/##' | fzf | xargs)"

alias emulator="$HOME/Android/Sdk/emulator/emulator"
alias api_28="$HOME/Android/Sdk/emulator/emulator -avd Pixel_3a_XL_API_28"
alias api_29="$HOME/Android/Sdk/emulator/emulator -avd Nexus_6_API_29"
alias api_30="$HOME/Android/Sdk/emulator/emulator -avd Pixel_2_API_30"
alias api_31="$HOME/Android/Sdk/emulator/emulator -avd Pixel_3a_XL_API_31"
alias lampp-start='sudo /opt/lampp/lampp start'

alias vpint='sudo openvpn ~/vpn/kmk-int.ovpn'
alias vpprod='sudo openvpn ~/vpn/kmk-prod.ovpn'
alias vpdev='sudo openvpn ~/vpn/kmk-dev.ovpn'
alias vim='nvim'

export PATH=$PATH:"$HOME/Apps/bin"
export PATH=$PATH:"$HOME/scripts"
export PATH=$PATH:"$HOME/.rbenv/bin"
export PATH=$PATH:$HOME/.local/share/nvim/mason/bin
export PATH="$PATH:/opt/nvim"

git() {
  if [ "$1" = "pair" ]; then
    RBENV_VERSION=3.1.6 command git pair "${@:2}"
  else
    command git "$@"
  fi
}

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi
eval "$(rbenv init -)"
