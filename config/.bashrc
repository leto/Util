# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# This is ... madness.
export PERL5LIB="/opt/local/lib/perl5:/Library/Perl/5.8.8"
export TERMINFO=/usr/share/terminfo
export HISTCONTROL=ignoredups
export HISTCONTROL=ignoreboth
shopt -s checkwinsize

export HARNESS_OPTIONS="j"
#export HARNESS_TIMER=0
#export HARNESS_VERBOSE=0


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

eval "`dircolors -b`"
alias ls='ls --color=auto'

# should only do this on OS X
export LSCOLORS=Dxfxcxdxbxegedabagacad
export EDITOR=vim
export DISPLAY=:0.0
# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi

export PATH=/sbin:/bin:/usr/sbin:/opt/local/sbin:/usr/bin:/usr/games:/opt/bin:/opt/local/bin:/usr/local/sbin:/usr/local/bin:/usr/X11R6/bin:~/bin
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

####### git aliases
alias glp="git log -p"
alias githist="git log -p"
alias undo="git reset HEAD^"
alias gd="git diff -a --diff-filter=ACDTMR |colordiff|less -R"
alias gca="git commit -a"
alias gsa="git status -a"
alias gco="git checkout"
alias gcom="git checkout master"
alias gcob="git checkout bleed"
alias gpull="git pull"
alias gpush="git push"
alias ga="git add"
alias gc="git clone"
alias gb="git branch"
alias gba="git branch -a"
alias gcb="git checkout -b "
alias gpb="git pull origin bleed"
alias gpm="git pull origin master"
alias gPb="git push origin bleed"
alias gPm="git push origin master"

### bash aliases
alias perl=perl5.10
alias pdF="perldoc -F"
alias jpg_resize_all='for i in `ls`; do jpg_resize $i; done'
alias wwwmech="perl -MWWW::Mechanize::Shell -eshell"
alias update_minicpan="minicpan -r http://www.cpan.org -l /usr/minicpan"
alias slist="screen -list"
alias cdw="cd ~/work"
alias cdc="cdw;cd current"
alias cdt="cdc;cd trunk"
alias sb="sudo bash"
alias cdw="cd ~/work"
alias dh="df -h"
alias ls='ls -G'
alias lt="ls -latr"
alias lsd="ls -lad"
alias rf="rm -rf "
alias ll="ls -la"
alias la="ls -a"
alias date="date '+ %A %B %d %X %Y'"
alias tz="tar zxvvpf"
alias lg="ls -al | grep"
alias vi=vim
alias v=vim
alias vb="vim ~/.bashrc; source ~/.bashrc"
alias vv="vim ~/.vimrc"
alias tdump="tcpdump -nnXSs 0"
alias screenshot="xwd -display :0 -root > screenshot.dmp"
alias h="history|tail -n 25"
alias hg="history|grep "
alias m=make
alias l=less
alias sx="ssh -XA"

function dl () {
    colordiff -u $1 $2 |less -R
}

largest () {
    du $1 |sort -rn |head
}

mount_iso () {
	mdconfig -a -t vnode -f $1 -u 1
	mount -t cd9660 /dev/md1 /mnt/iso
}
umount_iso() {
	mount -u $1
	mdconfig -d -u 1
}

# by Aaron "H-Bomb" Harsh
..to () {
   cd `pwd | perl -pe "s[(.*/[^/]*$1[^/]*/).*][\\1/]"`
}

export up2='../..'
export up3='../../..'
export up4='../../../..'
export up5='../../../../..'
export up6='../../../../../..'
export up7='../../../../../../..'
export up8='../../../../../../../..'

alias ..='cd ..'
alias 2..='cd $up2' 
alias 3..='cd $up3'
alias 4..='cd $up4'
alias 5..='cd $up5'
alias 6..='cd $up6'
alias 7..='cd $up7'
alias 8..='cd $up8'

### testing aliases
function bt () {
    perl Build.PL && 
    ./Build test --verbose 1 --test_files $1 |colortest
}
function t () {
    ./Build test --verbose 1 --test_files $1 |colortest
}
alias xt="t xt/*"
alias tcover="./Build testcover --verbose 1 |colortest"
alias pb="perl Build.PL"
alias tlikenew="pb && ./Build clean && pb && t"

function modversion () { 
    perl -M$1 -le "print $1->VERSION"
}
alias perlconfig="perl -e 'use Config;use Data::Dumper;print Dumper \%Config;'"

##########

####### svn aliases
alias colorsvn=svn
alias sdl=svn_diff_less
alias sup='colorsvn up'
alias ssa="colorsvn status"
alias ss="svn status |grep -v '\.swp$'|grep -v '\.swo$' |grep -v '~$' |grep -v '\._'"
alias ssc="svn status |grep -v '\.swp$' |grep -v '~$' |grep -v '\._' |grep '^C'"
alias sa="colorsvn add"
alias si="colorsvn info"
alias sl="colorsvn log"
alias sco="colorsvn co"
alias svn_newdirs="svn mkdir tags trunk branches"
alias sv=svnversion
alias svn_delete_unknown="svn stat | grep '^?' | sed -e 's/^\? *//' | xargs svn --force del"
alias svn_delete_nonexistent="svn stat | grep '^!' | sed -e 's/^\! *//' | xargs svn --force del"
alias scot_mmr="svn co svn+ssh://leto@leto.net/usr/local/svn/Math-MatrixReal/trunk"

scot () {
    svn co svn+ssh://leto@leto.net/usr/local/svn/$1/trunk $2
}

source ~/.bash/git-completion.bash
source ~/.bash/hosts
