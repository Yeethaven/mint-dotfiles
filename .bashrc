
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
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

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
#if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
#    debian_chroot=$(cat /etc/debian_chroot)
#fi

# set a fancy prompt (non-color, unless we know we "want" color)
#case "$TERM" in
#    xterm-color|*-256color) color_prompt=yes;;
#esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

#if [ -n "$force_color_prompt" ]; then
#    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
#	color_prompt=yes
#    else
#	color_prompt=
#    fi
#fi

#if [ "$color_prompt" = yes ]; then
#    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
#else
#    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
#fi
#unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
#case "$TERM" in
#xterm*|rxvt*)
#    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
#    ;;
#*)
#    ;;
#esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

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

# ----- User defined -----

alias l='ls -ahl'
alias nano='nano -l'
alias sc='source ~/.bashrc'
alias vb='vim ~/.bashrc'
alias vv='vim ~/.vimrc'
alias c='clear'
alias wq='exit'
# alias cip='ssh or38uqot@cip2a0.cip.cs.fau.de'

# run valgrind with best settings
# call like: memtest ./executable
memtest() {
  valgrind --leak-check=full --show-leak-kinds=all --track-origins=yes "$@"
}
#run gcc with recommended settings
#call like: compile out in_1.c in_X.c
compile() {
  gcc -std=c11 -pedantic -Wall -Werror -D_XOPEN_SOURCE=700 -o "$@";
}


# HPC
alias cs3='ssh or38uqot@cs3-login.informatik.uni-erlangen.de'
meggie() {
  cd ~/Uni/6.\ Semester\ \(SS23\)/HPCPra/
  ssh -i ./hpc scvl106h@cshpc.rrze.fau.de
}
megcp() {
  scp -i ./hpc "$1" scvl106h@cshpc.rrze.fau.de:~
}


# --- Mint stuff ---
# flowy stuff
alias fstart='systemctl --user start flowy.service'
alias fstop='systemctl --user stop flowy.service'
alias fstatus='systemctl --user status flowy.service'
alias fedit='sudo vim /etc/systemd/user/flowy.service'
alias freload='systemctl --user daemon-reload'

# meinCampus stuff
#alias cstart='systemctl --user start campus.service'
#alias cstop='systemctl --user stop campus.service'
#alias cstatus='systemctl --user status campus.service'
#alias cedit='sudo vim /etc/systemd/user/campus.service'
#alias creload='systemctl --user daemon-reload'

# grub stuff
alias gedit='sudo vim /etc/default/grub'
alias greload='sudo update-grub'

# openVPN/NordVPN stuff
#nord() {
#	sudo openvpn "/etc/openvpn/ovpn_tcp/$@.nordvpn.com.tcp.ovpn"
#}
alias nlog='nordvpn login'
alias ncon='nordvpn connect'
alias ndis='nordvpn disconnect'
alias nstat='nordvpn status'

# spicetify stuff
export SPICETIFY_INSTALL="/home/hoven/.spicetify"
export PATH="$PATH:$HOME/.spicetify"
export PATH="$SPICETIFY_INSTALL:$PATH"

# cargo
export PATH="/home/hoven/.cargo/bin:$PATH"

#tmux stuff
alias st="tmux source-file ~/.tmux.conf"

#compress a pdf
pdfcompress ()
{
   gs -q -dNOPAUSE -dBATCH -dSAFER -sDEVICE=pdfwrite -dCompatibilityLevel=1.3 -dPDFSETTINGS=/screen -dEmbedAllFonts=true -dSubsetFonts=true -dColorImageDownsampleType=/Bicubic -dColorImageResolution=144 -dGrayImageDownsampleType=/Bicubic -dGrayImageResolution=144 -dMonoImageDownsampleType=/Bicubic -dMonoImageResolution=144 -sOutputFile=${1%.*}.compressed.pdf $1;
}

#clean unwanted/orphaned packages
cleanup ()
{
	sudo apt-get autoclean
	sudo deborphan | xargs sudo apt-get -y remove --purge
	sudo apt autoremove
}

# general basic commands
alias inf='inxi -Fxzd'
alias svim='sudo vim'
alias pdfcombine='echo pdftk A=in1 B=in2 cat A1-10 B A11-15 output out.pdf'
pdfmerge ()
{
	pdftk "$1" "$2" cat output "$3"
}

# prompt
#export PS1="[\[\e[1;34m\]\A\[\e[m\]] [\[\e[1;32m\]\u\[\e[m\]]──[\[\e[1;36m\]\w\[\e[m\]] \\$ "
export PS1="[\[\e[1;34m\]\A\[\e[m\]] [\[\e[1;32m\]\u@\h\[\e[m\]]──[\[\e[1;36m\]\w\[\e[m\]] \\$ "
#export PS1="\[\e[1;34m\][\[\e[m\]\[\e[1;34m\]\A\[\e[m\]\[\e[1;34m\]]\[\e[m\] [\[\e[1;32m\]\u\[\e[m\]]──[\[\e[1;36m\]\w\[\e[m\]] \[\e[1;35m\]\\$\[\e[m\] "

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/hoven/Programs/anaconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/hoven/Programs/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/home/hoven/Programs/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/hoven/Programs/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<
