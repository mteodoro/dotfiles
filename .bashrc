if [ -z "$PS1" ]; then
    return
fi

#OS-specific stuff
if [ -f ~/.bashrc.os-`uname -s` ]; then
    . ~/.bashrc.os-`uname -s`
fi

#host-specific stuff
if [ -f ~/.bashrc.host ]; then
    . ~/.bashrc.host
fi

alias utcdate='TZ=UTC date'
alias ps?='ps ax | grep'
alias ll='ls -la'
alias grep='grep --color=auto'
alias quickweb='python -c "import SimpleHTTPServer;SimpleHTTPServer.test()"'

case $TERM in
    xterm*)
        PS1='[\u@${HOSTNAME} \W]\$ '
        PROMPT_COMMAND='echo -ne "\033]0;${HOSTNAME}: ${PWD/#$HOME/~}\007"'
        ;;
    *)
        PS1='[\u@${HOSTNAME} \W]\$ '
        ;;
esac

export SVN_EDITOR=vim

export HISTCONTROL=erasedups
#export HISTCONTROL=ignoreboth:erasedups
export HISTSIZE=100000
shopt -s histappend
#export PROMPT_COMMAND='history -a; history -n; history -w'
export PROMPT_COMMAND="history -a; $PROMPT_COMMAND"
export PYTHONSTARTUP=~/.python

#/usr/local stuff
if [ -d /usr/local/bin ]; then
    export PATH=/usr/local/bin:"${PATH}"
fi

if [ -d /usr/local/man ]; then
    export MANPATH=/usr/local/man:"${MANPATH}"
fi

if [ -d /usr/local/share/man ]; then
    export MANPATH=/usr/local/share/man:"${MANPATH}"
fi

if [ -d /usr/local/ssl/man ]; then
    export MANPATH=/usr/local/ssl/man:"${MANPATH}"
fi


#~ stuff
if [ -d ~/bin ] ; then
    export PATH=~/bin:"${PATH}"
fi

if [ -d ~/man ]; then
    export MANPATH=~/man:"${MANPATH}"
fi

#set up virtualenvwrapper
if [ -f /usr/local/bin/virtualenvwrapper.sh ] ; then
    export WORKON_HOME=~/.virtualenvs
    mkdir -p $WORKON_HOME
    export PIP_VIRTUALENV_BASE=$WORKON_HOME
    export PIP_RESPECT_VIRTUALENV=true
    export PROJECT_HOME=~/dev/scm
    source /usr/local/bin/virtualenvwrapper_lazy.sh
fi

#see what screens are running
if [ $TERM != 'screen' ]; then
    screen -ls | grep -v 'No Sockets found'
fi

