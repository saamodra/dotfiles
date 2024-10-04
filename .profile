export EDITOR="nvim"
export BROWSER="microsoft-edge"

alias gdcn!="git duet-commit --amend --no-edit"
alias gdc="git duet-commit"
alias gamend='git commit --amend --no-edit'
alias port-killer="$HOME/scripts/port-killer.sh"
alias rg="ranger"
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

alias emulator="$HOME/Android/Sdk/emulator/emulator"
alias api_28="$HOME/Android/Sdk/emulator/emulator -avd Pixel_3a_XL_API_28"
alias api_29="$HOME/Android/Sdk/emulator/emulator -avd Nexus_6_API_29"
alias api_30="$HOME/Android/Sdk/emulator/emulator -avd Pixel_2_API_30"
alias api_31="$HOME/Android/Sdk/emulator/emulator -avd Pixel_3a_XL_API_31"
alias lampp-start='sudo /opt/lampp/lampp start'

alias vpint='sudo openvpn ~/vpn/kmk-int.ovpn'
alias vpprod='sudo openvpn ~/vpn/kmk-prod.ovpn'
alias vpdev='sudo openvpn ~/vpn/kmk-dev.ovpn'

export PATH=$PATH:/usr/local/go/bin
export PATH=$PATH:"$HOME/Apps/bin"
export PATH=$PATH:"$HOME/.local/share/gem/ruby/3.1.0/bin"

eval "$(~/.rbenv/bin/rbenv init -)"


# Added by Toolbox App
export PATH="$PATH:/home/samodra/.local/share/JetBrains/Toolbox/scripts"

