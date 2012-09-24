export DEBEMAIL=jonathan@leto.net
shopt -s cdspell # allow bad spelling with cd

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

ulimit -c unlimited

# don't clear the screen afterwards 'cause that is annoying
export LESS="-X"

export PERL_MM_USE_DEFAULT=1
export PG_PREFIX=$HOME/pg
export PGDATA=$PG_PREFIX/data
export PARROT=$HOME/git/parrot
export PATH=
export PATH=/home/leto/git/rakudo/parrot_install/bin:$PATH
export PATH=$PATH:$PARROT/installed_parrot/bin:$PARROT/tools/dev:/opt/local/bin
export PATH=$PATH:~/bin:/usr/local/bin:/sbin:/bin:/usr/sbin:/opt/local/sbin:/usr/bin:/usr/games:/opt/bin:/usr/local/sbin
export PATH=$PATH:/usr/X11R6/bin:$PGPREFIX/bin:~/svn/llvm/Debug/bin
export PATH=$HOME/pg/bin:/home/leto/local-lib/bin:$PATH
export PATH=$PATH:$HOME/.gem/ruby/1.8/bin
export PATH=$PATH:$HOME/android/sdk/tools
export PATH=$PATH:$HOME/.perl6/bin
export PATH=~/.cabal/bin:$PATH

export LD_LIBRARY_PATH=/usr/lib:/usr/local/lib:$HOME/pg/lib:$HOME/lib:$HOME/git/rakudo/parrot_install/lib:$HOME/git/parrot/installed_parrot/lib
export PERL5LIB="$HOME/git/util/perl_lib:$HOME/perl5/lib/perl5"

export GIT_COMMITTER_EMAIL=jonathan@leto.net
export GIT_COMMITTER_NAME='Jonathan "Duke" Leto'
export GIT_AUTHOR_EMAIL=jonathan@leto.net
export GIT_AUTHOR_NAME='Jonathan "Duke" Leto'

PAGER="less -FXRS"
export TEST_JOBS=4
export JSLIB=~/js
export TERMINFO=/usr/share/terminfo

shopt -s checkwinsize
export GIT_PS1_SHOWDIRTYSTATE=42
export GIT_PS1_SHOWSTASHSTATE=42
#export HARNESS_OPTIONS="j"
#export HARNESS_TIMER=0
#export HARNESS_VERBOSE=0
# bus error central
#export MallocScribble=42
#export MallocStackLogging=42
#export MallocStackLoggingNoCompact=42
#export MallocCheckHeapStart=1000
#export MallocCheckHeapEach=100

# make less more friendly for non-text input files, see lesspipe(1)
#[ -x /usr/bin/lesspipe ] && eval "$(lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME}: ${PWD/$HOME/~}\007"'
    ;;
*)
    ;;
esac

if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
fi

# should only do this on OS X
export LSCOLORS=Dxfxcxdxbxegedabagacad
export EDITOR=vim
export DISPLAY=:0.0
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi

export bgcolor=black
export C1='[0;32m'
export C2='[0;37m'
export C3='[0m'
export C4='^[[0;32m'
export C5='[0;33m'
export C6='[0;31m'
export PS1='\[$C1\](\[$C2\]\h\[$C1\])(\[$C2\]\w\[$C1\]\[$C6\]$(__git_ps1 " %s "\[$C1\])\[$C3\]\[$C1\])\$\[$C3\] '
#export PS1='\[$C1\](\[$C2\]\h\[$C1\])(\[$C2\]\w\[$C1\]\[$C6\]\[$C1\]\[$C3\]\[$C1\])\$\[$C3\] '
export TERM=xterm-color

# Bash history options
shopt -s histappend
shopt -s cmdhist
export HISTCONTROL=ignoreboth
unset HISTFILESIZE
export HISTSIZE=100000
export HISTCONTROL=ignoreboth
export HISTIGNORE='ls:bg:f:history'
export HISTTIMEFORMAT='%F %T '
# This makes bash write to .bash_history immediately instead of on exit
export PROMPT_COMMAND='history -a; history -n'

export up2='../..'
export up3='../../..'
export up4='../../../..'
export up5='../../../../..'
export up6='../../../../../..'
export up7='../../../../../../..'
export up8='../../../../../../../..'

# node.js version manager
NVM_DIR=$HOME/git/nvm
[ -e $NVM_DIR/nvm.sh ] && source $NVM_DIR/nvm.sh && nvm use

# this will pickup *.sh and *.bash
for f in ~/.bash/*sh; do
    source $f
done

# perlbrew
[ -e ~/perl5/perlbrew/etc/bashrc ] && source ~/perl5/perlbrew/etc/bashrc

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
