
# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin:/home/woi/App/git-duet:$JAVA_HOME/bin"

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

export EDITOR="lvim"
export BROWSER="google-chrome"
export MAX_RENDERED_HEIGHT=54

alias fm="nnn"
alias gdcn!="git duet-commit --amend --no-edit"
alias gdc="git duet-commit"
alias port-killer="/home/woi/scripts/port-killer.sh"
alias rg="pipx run --spec ranger-fm ranger"

# NNN Config
export NNN_BMS="h:~;D:~/Downloads;C:~/Downloads/Compressed"
export NNN_USE_EDITOR=1

. "$HOME/.cargo/env"
PATH=/home/woi/.cargo/bin:/home/woi/.rvm/gems/ruby-3.0.0/bin:/home/woi/.rvm/gems/ruby-3.0.0@global/bin:/home/woi/.rvm/rubies/ruby-3.0.0/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin:/home/woi/.rvm/bin:/home/woi/App/git-duet:/home/woi/.antigen/bundles/robbyrussell/oh-my-zsh/lib:/home/woi/.antigen/bundles/robbyrussell/oh-my-zsh/plugins/git:/home/woi/.antigen/bundles/robbyrussell/oh-my-zsh/plugins/heroku:/home/woi/.antigen/bundles/robbyrussell/oh-my-zsh/plugins/docker:/home/woi/.antigen/bundles/robbyrussell/oh-my-zsh/plugins/pip:/home/woi/.antigen/bundles/robbyrussell/oh-my-zsh/plugins/lein:/home/woi/.antigen/bundles/robbyrussell/oh-my-zsh/plugins/command-not-found:/home/woi/.antigen/bundles/zsh-users/zsh-autosuggestions:/home/woi/.antigen/bundles/zsh-users/zsh-syntax-highlighting:/home/woi/.antigen/bundles/agkozak/zsh-z:/home/woi/.fzf/bin:/home/woi/.rvm/bin:/home/woi/.local/bin:~/.config/rofi/scripts


# Added by Toolbox App
export PATH="$PATH:/home/woi/.local/share/JetBrains/Toolbox/scripts"

