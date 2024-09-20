export EDITOR="nvim"
export BROWSER="google-chrome"
export MAX_RENDERED_HEIGHT=54

alias fm="nnn"
alias gdcn!="git duet-commit --amend --no-edit"
alias gdc="git duet-commit"
alias gamend='git commit --amend --no-edit'
alias port-killer="$HOME/scripts/port-killer.sh"
alias rg="pipx run --spec ranger-fm ranger"
alias nvim="~/.local/bin/nvim"
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

# NNN Config
export NNN_BMS="h:~;D:~/Downloads;C:~/Downloads/Compressed"
export NNN_USE_EDITOR=1

export PATH="$HOME/.cargo/bin:\
/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:\
/usr/games:/usr/local/games:/snap/bin:\
/home/woi/.rvm/gems/ruby-3.1.4/bin:\
$HOME/App/git-duet:\
$HOME/.antigen/bundles/robbyrussell/oh-my-zsh/lib:\
$HOME/.antigen/bundles/robbyrussell/oh-my-zsh/plugins/git:\
$HOME/.antigen/bundles/robbyrussell/oh-my-zsh/plugins/heroku:\
$HOME/.antigen/bundles/robbyrussell/oh-my-zsh/plugins/docker:\
$HOME/.antigen/bundles/robbyrussell/oh-my-zsh/plugins/pip:\
$HOME/.antigen/bundles/robbyrussell/oh-my-zsh/plugins/lein:\
$HOME/.antigen/bundles/robbyrussell/oh-my-zsh/plugins/command-not-found:\
$HOME/.antigen/bundles/zsh-users/zsh-autosuggestions:\
$HOME/.antigen/bundles/zsh-users/zsh-syntax-highlighting:\
$HOME/.antigen/bundles/agkozak/zsh-z:\
$HOME/.fzf/bin:$HOME/.local/bin:\
$HOME/.cargo/env:\
$GEM_HOME/bin:\
$HOME/.cargo/env:\
$JAVA_HOME/bin:\
$HOME/.config/rofi/scripts"

# Added by Toolbox App
export PATH="$PATH:$HOME/.local/share/JetBrains/Toolbox/scripts"
export DATABASE_URL="postgres://postgres:postgres@localhost:5432/doccano_v3?sslmode=disable"
# export DATABASE_URL="postgres://postgres:postgres@localhost:5432/ner_doccano?sslmode=disable"


# Generated for envman. Do not edit.
[ -s "$HOME/.config/envman/load.sh" ] && source "$HOME/.config/envman/load.sh"


# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
