case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac


if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt 

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

## OTHER ENV VARIABLES
export DISPLAY=localhost:0.0
## PATHS
export PATH=$PATH:/mnt/c/Program\ Files\ \(x86\)/Google/Chrome/Application/:/mnt/c/Program\ Files/nodesjs/:/mnt/c/Users/eashw/Documents/GitHub/now-playing:/mnt/c/Users/eashw/Downloads/coding\ stuff/astyle_3.1_linux/astyle/build/gcc/bin/:/mnt/c/Users/eashw/AppData/Local/Microsoft\ VS\ Code/
export GOPATH="/home/eashw/gocode"

## ALIAS DEFINITIONS
alias pls='sudo'
alias astyle='astyle -A1 -s4 -C -S -N -Y -m0 -p -xg -D -k1 -W3i -xf -xh -c'
alias chrome='chrome.exe'
alias code='Code.exe'
alias node='node.exe'
alias sl='sl -e -a'
alias c='clear'
eval $(thefuck --alias)
eval $(thefuck --alias heck)
alias updaterino='sudo apt-get update; sudo apt-get upgrade; sudo apt-get dist-upgrade'
alias g++='g++ -Wall -Werror -pedantic -g --std=c++11'
alias website='/mnt/c/Users/eashw/Documents/GitHub/eashwar.github.io'
alias 281='cd /mnt/c/Users/eashw/OneDrive/umich/FA2018/EECS281'
alias 370='cd /mnt/c/Users/eashw/OneDrive/umich/FA2018/EECS370'
alias 250='cd /mnt/c/Users/eashw/OneDrive/umich/FA2018/STATS250'
alias 137='cd /mnt/c/Users/eashw/OneDrive/umich/FA2018/THEORY137'
alias 391='cd /mnt/c/Users/eashw/OneDrive/umich/FA2018/MUSPERF391'
alias syncat='pygmentize -g'
alias launch='cmd.exe /C start'
alias home='cd /mnt/c/Users/eashw'
alias sdldir='cd /mnt/c/Users/eashw/OneDrive/Documents/sdl'
alias speedtest='curl -s https://raw.githubusercontent.com/sivel/speedtest-cli/master/speedtest.py | python -'
alias caen='ssh -X caen'

## PS1 AND PS2 DEFINITION
#export PS1="\$(spotify)\n"
#export PS1="$PS1\[\033[38;5;135m\]|\[\033[m\]" # Pipe, default bg and purple
export PS1="\[\033[38;5;135m\]|\[\033[m\]" # Pipe, default bg and purple
export PS1="$PS1\[\033[38;5;135m\]\A\[\033[m\]" # Time, default bg and purple
export PS1="$PS1\[\033[38;5;135m\]|\[\033[m\]" # Pipe, default bg and purple
export PS1="$PS1\[\033[1;38;5;14m\]\u\[\033[m\]" # Username, black and cyan
export PS1="$PS1\[\033[38;5;32m\]@\[\033[m\]" # at symbol, default bg and blue
export PS1="$PS1\[\033[1;38;5;32m\]\h\[\033[m\]" # hostname, default bg and blue
export PS1="$PS1\[\033[38;5;9m\][\[\033[m\]" # open bracket, default bg and red 
export PS1="$PS1\[\033[1;38;5;9m\]\W\[\033[m\]" # working dir, default bg and red
export PS1="$PS1\[\033[38;5;9m\]]\[\033[m\]" # close bracket, default bg and red 
export PS1="$PS1\[\033[39m\]:\[\033[m\] " # colon, default

export PS2="\[\033[1;38;5;117m\]close your quotes dummy\[\033[m\] > "
