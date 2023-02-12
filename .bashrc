#!/usr/bin/env bash

# Path to the bash it configuration
export BASH_IT="$HOME/.bash_it"

# Lock and Load a custom theme file
# location /.bash_it/themes/
export BASH_IT_THEME='minimal'
# Tommy approved themes: sexy, sirup, rainbowbrite, bakke, minimal, nwinkler

# Set the global default editor, used for things like `git rebase -i`
# might not be necessary with bash-it-plugin edit-mode-vi
export EDITOR=nano
export GIT_EDITOR=nano

# Don't check mail when opening terminal.
unset MAILCHECK

# Set this to false to turn off version control status checking within the prompt for all themes
export SCM_CHECK=true

# Load Bash It
source "$BASH_IT"/bash_it.sh

# while the `bash-it enable completion system` is still broken in 18.04
if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi

export USER_ID=$(id -u)
export GROUP_ID=$(id -g)

export COMPOSE_DOCKER_CLI_BUILD=1
export DOCKER_BUILDKIT=1
export CLOUDSDK_PYTHON=/usr/bin/python3
export LD_LIBRARY_PATH=/usr/local/lib

export SSH_AUTH_SOCK=/run/user/${UID}/gnupg/S.gpg-agent.ssh

alias gitg="gitg &>/dev/null"
alias gvim="gvim &>/dev/null"
alias mvim="gvim &>/dev/null"
alias lock="xtrlock"

alias docker-compose='docker compose'
alias build-vidio='docker-compose run --rm web yarn build:fast'
alias build-lite='docker-compose run --rm vidio-lite yarn build'
alias build-all='build-lite && build-vidio'
alias dc='docker-compose'
alias dcrm='dc run --rm --use-aliases --service-ports'
alias api_30='/home/woi/Android/Sdk/emulator/emulator -avd Pixel_2_API_30'
alias api_28='/home/woi/Android/Sdk/emulator/emulator -avd Pixel_4_XL_API_28'
alias api_31='/home/woi/Android/Sdk/emulator/emulator -avd Pixel_3a_XL_API_31'
alias vpint='sudo openvpn ~/vpn/kmk-int.ovpn'
alias lampp-start='sudo /opt/lampp/lampp start'
alias gamend='git commit --amend --no-edit'
alias vpprod='sudo openvpn ~/vpn/kmk-prod.ovpn'

eval "$(rbenv init -)"

PATH="$HOME/.local/bin:$PATH"
export PATH

# Ata's keyboard aliases
  alias x='xinput --list'

  colemak(){
    setxkbmap -device $1 -layout us -variant colemak -option caps:backspace
  }
  alias c=colemak

  dvorak(){
    setxkbmap -device $1 -layout us -variant dvorak
  }
  alias d=dvorak

  qwerty(){
    setxkbmap -device $1 -layout us
  }
  alias qa='setxkbmap -layout us' # Always available to get you back to Query
  alias q=qwerty

# Natrual Scrolling
  natural-scrolling() {
    local device_id
    printf "Devices:"
    xinput list
    printf "\n\n"
    read -p "Device Id: " device_id
    xinput set-prop $device_id 280 -1, -1, -1
    printf "\n"
  }

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
. "$HOME/.cargo/env"
