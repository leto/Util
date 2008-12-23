let $PAGER = 'less'
let $LESS = 'dQFe'

autocmd BufNewFile,BufRead COMMIT_EDITMSG set filetype=gitcommit

set list listchars=tab:\|_,trail:.
highlight SpecialKey ctermfg=DarkRed

au BufNewFile,BufRead *.pl,*.pm,*.t,*.pod     setf perl
au BufNewFile,BufRead *.pmc,*.ops,*.i       setf c
au BufNewFile,BufRead *.tt,*.ttml       setf tt2html
au BufNewFile,BufRead *.tex,*.bib       setf tex
au BufNewFile,BufRead *.js set ft=javascript.jquery

autocmd FileType perl call PerlMode()
autocmd FileType tex  call TexMode()
autocmd FileType text call TextMode()
autocmd FileType mail call TextMode()

" Folding
set foldmethod=indent
set nofoldenable
set modelines=20
set modeline
highlight Folded ctermbg=darkgrey ctermfg=red
highlight FoldColumn ctermbg=darkgrey ctermfg=white

:map <F7> :if exists("syntax_on") <Bar>
    \   syntax off <Bar>
    \ else <Bar>
    \   syntax enable <Bar>
    \ endif <CR>

au BufReadPost *
  \ if line("'\"") > 0 && line("'\"") <= line("$") |
  \   exe "normal g`\"" |
  \ endif

map <silent> <C-N> :se invhlsearch<CR>

let Tlist_Inc_Winwidth=0

set mouse=a
set whichwrap=b,s,<,>
set listchars=tab:>-,trail:-
set ignorecase smartcase
set bs=2
set showcmd             " Show (partial) command in status line.
"set showmatch           " Show matching brackets.
set noshowmatch
set incsearch           " Incremental search
set textwidth=0         " Don't wrap words by default
set nocompatible        " Use Vim defaults (much better!)
set noerrorbells 
set noflash
set matchpairs+=<:>
set joinspaces
set lbr                 " only wrap at word boundaries
set magic
set showmode
set esckeys
set tabstop=4
set shiftwidth=4
set shiftround
set expandtab		" soft tabs
set ruler
set wildchar=<TAB>
set incsearch
set hlsearch
set history=500
set undolevels=1000
set splitbelow
set laststatus=2
set iskeyword+=:

"set statusline=%([%-n]%y\ %f%M%R%)\ %#ErrorMsg#%{GitBranch()}%#StatusLine#\ %=\ %(%l,%c%V\ %P\ [0x%02.2B]%)

let git_diff_spawn_mode=1
let g:NERDShutUp=42


set ai
filetype plugin indent on

"============================================================================
" Filename Autocompletion
"----------------------------------------------------------------------------
set wildchar=<Tab>          " wc:  tab does autocompletion
set wildmode=longest,list   " wim:  bash-style autocompletion
" wig:  when autocompleting, ignore certain files
set wildignore=*~,#*#,*.sw?,*.o,*.class,.viminfo,*.pdf

au FileType vim set iskeyword+=. iskeyword+=/ iskeyword+=~

let mapleader = ","
let g:mapleader = ","

"Fast saving
nmap <leader>w :w!<cr>
nmap <leader>x :x!<cr>
nmap <leader>f :find<cr>

nmap :W :w
nmap :ww :w!
nmap :X :x
nmap :xx :x!
nmap :Q :q
nmap :qq :q!


nmap <f5> :make<CR>
nmap <f4> :!bash<cr>
function Fxxd()
  let c=getline(".")
    if c =~ '^[0-9a-f]\{7}:'
        :%!xxd -r
    else
        :%!xxd -g4
    endif
endfunction
map <F6> :call Fxxd()<cr>

map ,h :call PerlDoc()<C-M>:set nomod<C-M>

vmap ,lc          :perldo s/(.*)/lc $1/e<cr>
 map ,lc       viw:perldo s/(.*)/lc $1/e<cr>
map! ,lc  <esc>viw:perldo s/(.*)/lc $1/e<cr>
vmap ,uc          :perldo s/(.*)/uc $1/e<cr>
 map ,uc       viw:perldo s/(.*)/uc $1/e<cr>
map! ,uc  <esc>viw:perldo s/(.*)/uc $1/e<cr>

" replace hard tabs with soft tabs
map  ,kt      :perldo s/^(\t+)/'    ' x length $1/e<cr>
map! ,kt <esc>:perldo s/^(\t+)/'    ' x length $1/e<cr>i

map  ,wt      :perldo s/\s+$//<cr>
map! ,wt <esc>:perldo s/\s+$//<cr>i
map  ,sd       :w!<CR>:! svn diff  % \| colordiff \| less -R<CR>
map! ,sd  <ESC>:w!<CR>:! svn diff  % \| colordiff \| less -R<CR>

map  ,st       :w!<CR>:! ispell -t % <CR>
map! ,st  <ESC>:w!<CR>:! ispell -t % <CR>
map  ,sp       :w!<CR>:! ispell % <CR>
map! ,sp  <ESC>:w!<CR>:! ispell % <CR>

map ,r  :!chmod +x % && ./% <cr>
map ,R  :!chmod +x % && ./%

map ,d  :!perl5.10 -d -Ilib -Iblib %<cr>
map ,dt :!perl5.10 -d:Trace -Ilib -Iblib %<cr>
map ,c  :!perl5.10 -Ilib -wc %<cr>
map ,pd :!perldoc -F %\|less <cr>
map ,pe :!perl -e ' 

"map ,t  :!DEBUG=1 ./Build test --verbose 1 --test_files % \|colortest<cr>
map ,tl :!DEBUG=1 ./Build test --verbose 1 --test_files % \|colortest\|less -R<cr>
map ,T  :!DEBUG=1 ./Build test --verbose 1 --test_files   \|colortest<cr>

iab slef self
iab alos also
iab aslo also
iab charcter character
iab charcters characters
iab exmaple example
iab shoudl should
iab seperate separate
iab teh the
iab Yjl Jonathan Leto
iab Yjle jonathan@leto.net
iab Ydate <C-R>=strftime("%a %b %d %T %Z %Y")<CR>
iab udd {use Data::Dumper; print Dumper [ ];}<esc>ei

set background=dark
syntax on

let FILE="/home/leto/.vimrc.wordlist"
if filereadable(FILE)
	exe "source" . FILE
endif


imap <C-J> <c-o>gqap
map <C-J> gqap
map <F2> GoDate: <Esc>:read !date<CR>kJ

map ,t :call RunTest()<cr>
function! RunTest()
    :write!
    :redraw!
    let file    = expand("%")
    let swig_ext= '\.i'
    if match(file, '\.pm') > -1 
        let stuff   = matchlist( file, '.*/\(.*\)/Test\.pm')
        execute ":!DEBUG=1 ./Build test --verbose 1 --test_files t/" . stuff[1] . ".t \| colortest"
    elseif match(file, '\.t') > -1
        execute ":!DEBUG=1 ./Build test --verbose 1 --test_files % \|colortest"
    elseif match(file, swig_ext ) > -1
        let stuff = substitute( file, swig_ext, "", "g")
        let stuff = substitute( stuff, 'swig/', "", 'g')
        execute ":!DEBUG=1 ./Build test --verbose 1 --test_files t/" . stuff . ".t \|colortest"
    else
        echo "Does not appear to be a testable file, Will Robinson!"
    endif
endfunction


set suffixes=.bak,~,.swp,.o,.info,.aux,.log,.dvi,.bbl,.blg,.brf,.cb,.ind,.idx,.ilg,.inx,.out,.toc
set more

"set backupdir=
set viminfo='5      " Use viminfo, remember marks for the last 5 files
"set cursorline 
"set cursorcolumn
"
set guicursor=a:blinkon600-blinkoff400

map _l a\usepackage{latexsym,amsmath,amssymb,fullpage,epsfig}<CR>\documentclass{article}<CR>\usepackage{}<CR><CR>\begin{document}<CR>\end{document}<Esc>ko
map _ps a#!/usr/bin/perl -w<Esc>o<CR>use strict;<CR>$\|++;<CR><Esc>
map _pm apackage Foo;<Esc>o <CR>use strict;<CR><CR>sub new {<CR>my $class = shift;<CR>my $self = {};<CR>bless $self, $class;<CR>}<CR>1;<Esc>

" Set up assembly programming
let asmsyntax = "nasm"
" "au! BufRead,BufNewFile   *.asm
" "au! BufRead,BufNewFile   *.inc   se syn=nasm

function! TextMode()            " Stolen from David Hand
    set nocindent               " nocin:  don't use C-indenting
    set nosmartindent           " nosi:  don't "smart" indent, either
    set autoindent              " ai:  indent to match previous line
    set noshowmatch             " nosm:  don't show matches on parens, brackets, etc.
    set comments=n:>,n:#,fn:-   " com: list of things to be treated as comments
    set textwidth=72            " tw:  wrap at 72 characters
    set formatoptions=tcrq      " fo:  word wrap, format comments
    set dictionary+=/usr/local/dict/*  " dict:  dict for word completion
    set complete=.,w,b,u,t,i,k  " cpt:  complete words
endfunction

function! PerlMode()            " Stolen from David Hand
    set textwidth=80          
    set autoindent              " ai:  indent to match previous line
    set cindent                 " cin:  Use C-indenting
    set cinkeys=0{,0},!^F,o,O,e " cink:  Perl-friendly reindent keys
    set cinoptions=t0,+4,(0,)60,u0,*100  " cino:  all sorts of options
    set cinwords=if,else,while,do,for,elsif,sub
    set comments=n:#            " com:  Perlish comments
    set formatoptions=crql      " fo:  word wrap, format comments
    set nosmartindent           " nosi:  Smart indent useless when C-indent is on
    set showmatch               " show matches on parens, bracketc, etc.
    set autowrite
    set makeprg=/usr/bin/perl\ -wc\ %\ $*
    set errorformat=%f:%l:%m
    let perl_fold=1
    let perl_fold_blocks=1
    let perl_include_pod=1
    let perl_include_POD=1
    let perl_sync_dist = 300
endfunction               

function! TexMode()        
    set textwidth=80        
    set comments=n:%            " com:  latex comments
    set formatoptions=crql      " fo:  word wrap, format comments
    set showmatch               " show matches on parens, bracketc, etc.
endfunction               

function! PerlDoc()
  normal yy
  let l:this = @
  if match(l:this, '^ *\(use\|require\|package\) ') >= 0
    exe ':new'
    exe ':resize'
    " doesn't work on use base 'Foo::Bar'
    let l:this = substitute(l:this, '^ *\(use *\(base *\)*\|package\|require\) *', "", "")
    let l:this = substitute(l:this, ";.*", "", "")
    let l:this = substitute(l:this, " .*", "", "")
    exe ':0r!perldoc ' . l:this
    exe ':0'
    return
  endif
  normal yiw
  exe ':new'
  exe ':resize'
  exe ':0r!perldoc -f ' . @
  exe ':0'
endfunction
