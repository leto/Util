# If not running interactively, don't do anything
[ -z "$PS1" ] && return
export DYLD_LIBRARY_PATH=/opt/subversion/lib:/usr/local/lib:/usr/local/lib
export LD_LIBRARY_PATH=/usr/local/lib:/usr/local/lib
# This is ... madness.
#export PERL5LIB="/opt/local/lib/perl5/5.10.0/darwin-2level/:
#export PERL5LIB="/opt/local/lib/perl5/site_perl/5.8.8:/Library/Perl/5.8.8"
#export PERL5LIB=/opt/local/lib/perl5/site_perl/5.10.0:/opt/local/lib/perl5/site_perl/5.8.8:/Library/Perl/5.8.8
#export PERL5LIB=/opt/local/lib/perl5/site_perl/5.10.0:/opt/local/lib/perl5/site_perl/5.8.8
export PERL_MM_USE_DEFAULT=1
export TEST_JOBS=9
export JSLIB=~/js
export TERMINFO=/usr/share/terminfo
export HISTCONTROL=ignoredups
export HISTCONTROL=ignoreboth
shopt -s checkwinsize
export GIT_PS1_SHOWDIRTYSTATE=42
export GIT_PS1_SHOWSTASHSTATE=42

export HARNESS_OPTIONS="j"
#export HARNESS_TIMER=0
#export HARNESS_VERBOSE=0

# bus error central
#export MallocScribble=42
#export MallocStackLogging=42
#export MallocStackLoggingNoCompact=42
#export MallocCheckHeapStart=1000
#export MallocCheckHeapEach=100

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(lesspipe)"

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

[ -x "/usr/bin/dircolors" ] && eval "`dircolors -b`"

# should only do this on OS X
export LSCOLORS=Dxfxcxdxbxegedabagacad
export EDITOR=vim
export DISPLAY=:0.0
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi

export PATH=/opt/subversion/bin:~/bin:/usr/local/bin:/opt/local/bin:/sbin:/bin:/usr/sbin:/opt/local/sbin:/usr/bin:/usr/games:/opt/bin:/usr/local/sbin:~/bin:/usr/X11R6/bin:/opt/local/lib/postgresql83/bin/
export bgcolor=black
export C1='[0;32m'
export C2='[0;37m'
export C3='[0m'
export C4='^[[0;32m'
export C5='[0;33m'
export C6='[0;31m'
export PS1='\[$C1\](\[$C2\]\h\[$C1\])(\[$C2\]\w\[$C1\]\[$C6\]$(__git_ps1 " %s "\[$C1\])\[$C3\]\[$C1\])\$\[$C3\] '
export TERM=xterm-color
export HISTFILESIZE=5000
export HISTSIZE=5000
export up2='../..'
export up3='../../..'
export up4='../../../..'
export up5='../../../../..'
export up6='../../../../../..'
export up7='../../../../../../..'
export up8='../../../../../../../..'

source ~/.bash/git-completion.bash
source ~/.bash/hosts
source ~/.bashrc.aliases
