### tex vars
#export KPATHSEA_DEBUG=255
#export TEXMF=/usr/local/texlive/2007/texmf
#export TEXMFMAIN=/usr/local/texlive/2007/texmf
#export TEXPOOL=/usr/local/texlive/2007/texmf/web2c
## where pdftex looks for virtual fonts
#export VFFONTS= 
## where pdftex looks for Type1 (*.pfa,*pfb) fonts
#export T1FONTS= 
## where pdftex looks for to TrueType (*.ttf) fonts
#export TTFONTS=/usr/local/texlive/2007/texmf-dist/fonts/truetype
## where pdftex looks for pdftex config file (pdftex.cfg),
#export TEXPSHEADERS=/usr/local/texlive/2007/texmf-dist/doc/generic/pgf/version-for-pdftex/

export PERL5LIB=/home/leto/lib/perl5

##
# fuck beeping
xset -b
export PATH=/sbin:/bin:/usr/sbin:/usr/bin:/usr/games:/usr/local/sbin:/usr/local/bin:/usr/X11R6/bin:/home/leto/bin
export bgcolor=black
export C1='[0;32m'
export C2='[0;37m'
export C3='[0m'
export C4='^[[0;32m'
export PS1='\[$C1\](\[$C2\]\h\[$C1\])(\[$C2\]\w\[$C1\])\[$C3\]\[$C1\]\$\[$C3\] '
export TERMINFO=~/.terminfo
export TERM=xterm-color
export HISTFILESIZE=5000
export HISTSIZE=5000

### bash aliases
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
alias lb="ls -la | sort +4n"
alias ls="ls"
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
function t () {
	./Build test --verbose 1 --test_files $1 |colortest
}
alias tcover="./Build testcover --verbose 1 |colortest"
##########

####### svn aliases
alias svn=colorsvn
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


source ~/.bashrc.hosts
source ~/.bashrc.polyglot
