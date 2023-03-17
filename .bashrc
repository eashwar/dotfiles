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
export DISPLAY=:0
## PATHS
export GOROOT=/usr/local/go
export GOPATH=$HOME/go
export PATH=$GOPATH/bin:$GOROOT/bin:$PATH

## ALIAS DEFINITIONS
alias pls='sudo'
alias astyle='astyle -A2 -s4 -C -S -N -Y -m0 -p -xg -D -k1 -W3i -xf -xh -c -xw'
alias sl='sl -e -a'
alias c='clear'
alias update='sudo apt-get update; sudo apt-get upgrade; sudo apt-get dist-upgrade'
alias g++='g++ -Wall -Werror -pedantic -g --std=c++11'
alias launch='cmd.exe /C start'
alias home='cd /mnt/c/Users/eash'
alias odr='cd /mnt/c/Users/eash/OneDrive'
alias caen='ssh -X caen'
alias rm='rm -i'
alias python='python3'
alias neofetch='neofetch --ascii_colors 1 2 3 4 5 6'
alias ping='ping -c 4'
eval $(thefuck --alias)

## PS1 AND PS2 DEFINITION
#export PS1="\$(spotify)\n"
export PS1="\[\033[38;5;135m\]|\A|\[\033[m\]" # | time |, default bg and purple
export PS1="$PS1\[\033[1;38;5;14m\]\u\[\033[m\]" # Username, black and cyan
export PS1="$PS1\[\033[38;5;32m\]@\[\033[m\]" # at symbol, default bg and blue
export PS1="$PS1\[\033[1;38;5;32m\]\h\[\033[m\]" # hostname, default bg and blue
export PS1="$PS1\[\033[38;5;9m\][\[\033[m\]" # open bracket, default bg and red 
export PS1="$PS1\[\033[1;38;5;9m\]\W\[\033[m\]" # working dir, default bg and red
export PS1="$PS1\[\033[38;5;9m\]]\[\033[m\]" # close bracket, default bg and red 
export PS1="$PS1\[\033[39m\]:\[\033[m\] " # colon, default
#export PS1="\$(pwd)\n\$"
# Install Ruby Gems to ~/gems
export GEM_HOME=$HOME/gems
export PATH=$HOME/gems/bin:$PATH
export PATH=/home/eash/cmake-3.19.0-rc3-Linux-x86_64/bin:$PATH
neofetch

# opam configuration
test -r /home/eash/.opam/opam-init/init.sh && . /home/eash/.opam/opam-init/init.sh > /dev/null 2> /dev/null || true

neofetch # run neofetch on start of a new terminal instance

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export PATH=/usr/local/mysql/bin:$PATH
