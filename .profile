
# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

export EDITOR="vim"
export BROWSER="google-chrome"

alias fm="nnn"

# NNN Config
export NNN_BMS="h:~;D:~/Downloads;C:~/Downloads/Compressed"
export NNN_USE_EDITOR=1

. "$HOME/.cargo/env"
