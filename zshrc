# users generic .zshrc file for zsh(1)

## Environment variable configuration
#
# LANG
#
export LANG=ja_JP.UTF-8
export JAVA_HOME=/opt/jdk1.6.0_12/
export PATH=$PATH:$JAVA_HOME/bin

## Default shell configuration
#
# set prompt
#
ip=`LANG=C /sbin/ifconfig eth0 | grep 'inet addr' | awk -F: '{print $2}' | awk '{print $1}'`
ipw=`LANG=C /sbin/ifconfig wlan0 | grep 'inet addr' | awk -F: '{print $2}' | awk '{print $1}'`
autoload colors
colors
PROMPT="%n@%{${fg[green]}%}$ip$ipw%{${fg[white]}%}[%~]
%#"

#setopt auto change directory
#
setopt auto_cd

# auto directory pushd that you can get dirs list by cd -[tab]
#
setopt auto_pushd

# command correct edition before each completion attempt
#
setopt correct

# compacked complete list display
#
setopt list_packed

# no remove postfix slash of command line
#
setopt noautoremoveslash

# no beep sound when complete list displayed
#
setopt nolistbeep


# historical backward/forward search with linehead string binded to ^P/^N
#
autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^p" history-beginning-search-backward-end
bindkey "^n" history-beginning-search-forward-end
bindkey "\\ep" history-beginning-search-backward-end
bindkey "\\en" history-beginning-search-forward-end


## Command history configuration
#
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt hist_ignore_dups     # ignore duplication command history list
setopt share_history        # share command history data


## Completion configuration
#
fpath=(~/.zsh/functions/Completion ${fpath})
autoload -U compinit
compinit

zstyle ':completion:*:default' menu select=1  

## zsh editor
#
autoload zed

## Prediction configuration
#
autoload predict-on
#predict-off

## Alias configuration
#
# expand aliases before completing
#
setopt complete_aliases     # aliased ls needs if file/dir completions work

#alias xlock="xlock -mode maze"
alias ls="ls --color=auto"
alias lsdc="ls -la | grep ^d"
alias lsd="ls -F |grep /"
alias where="command -v"
alias j="jobs -l"
alias rm="trash"
alias ls="ls --color"
alias la="ls -a"
alias lf="ls -F"
alias ll="ls -l"
alias du="du -h"
alias df="df -h"
alias su="su -l"
alias google="w3m -F http://www.google.com/"
alias ncmpc="ncmpc -h 192.168.1.xx"
alias ssh_server="ssh 192.168.1.xx"

## load user .zshrc configuration file
#
[ -f ~/.zshrc.mine ] && source ~/.zshrc.mine

## start screen
#
if [ $TERM = "rxvt-unicode" -o $SHLVL = '1' ] ; then
exec screen -xR
fi
