# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

[[ $- != *i* ]] && return

# $HOME/gentoo/startprefix

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/krishna/miniconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/krishna/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/home/krishna/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/krishna/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<


export PATH="$HOME/.cargo/bin:$PATH"
alias cat='bat'
alias less='bat'

export PATH="$PATH:$HOME/github_bash_executables/unpack"
alias up='unpack'

# eval "$(pandoc --bash-completion)"

complete -cf sudo

# User specific aliases and functions
alias diff='diff --color=auto'
alias grep='grep --color=auto'
alias du='du -c -h'
alias mkdir='mkdir -p -v'
alias md='mkdir'
alias nano='nano -w'
alias ping='ping -c 5'
alias dmesg='dmesg -HL'

## ls
alias ls='ls -hF --color=auto'
alias sl='ls'
alias ll='ls -l'
alias la='ll -A'
alias lt='ll -rt'        # sort by date
alias lx='ll -BX'        # sort by extension
alias lz='ll -rS'        # sort by size
# alias lr='ls -R'       # recursive ls
# alias lrt='ls -lahrtg' # recursive ls
alias lm='ll | less'

## Safety features
alias cp='cp -iv'
alias mv='mv -iv'
# alias rm='rm -I'                    # 'rm -i' prompts for every file
# safer alternative w/ timeout, not stored in history
alias \rm=' timeout 3 rm -Iv --one-file-system'
alias del='trash-put -v'
alias rm='trash-put -v'
alias rd='rmdir'
alias ln='ln -i'
alias chown='chown --preserve-root'
alias chmod='chmod --preserve-root'
alias chgrp='chgrp --preserve-root'
alias cls=' echo -ne "\033c"'       # clear screen for real (it does not work in Terminology)

# alias _='sudo'

## Make Bash error tolerant
alias :q=' exit'
alias :Q=' exit'
alias :x=' exit'
alias q='exit'
alias cd..='cd ..'
alias ..='cd ..'         # Go up one directory'
alias ...='cd ../..'     # Go up two directories'
alias ....='cd ../../..' # Go up three directories'
alias -- -='cd -'        # Go back'

alias h='history'
# alias tree="find . -print | sed -e 's;[^/]*/;|____;g;s;____|; |;g'"

## Neovim stuff
if [ -n "$NVIM_LISTEN_ADDRESS" ]; then
    export PS1="» "
else
    export PS1="\$ "
fi

alias vimdiff='nvim -d'
alias oldvim="\vim"
alias vim="nvim"
alias vi="nvim"

# export MANPAGER="nvim -c 'set ft=man' -"
export MANPAGER='nvim +Man!'
export SUDO_EDITOR='/usr/bin/nvim'
export EDITOR="/usr/bin/nvim"
export VISUAL='/usr/bin/nvim'

alias edit='$EDITOR'
alias pager='$PAGER'
# alias irc='${IRC_CLIENT:=irc}'
alias rb='ruby'
alias ipy='ipython'

alias bc='bc -l'

export HISTCONTROL=ignoreboth:erasedups
shopt -s histappend
export HISTSIZE=500 # keep only last 500 commands
export HISTFILESIZE=100000 # keep only 100kb of text

export PDFVIEWER_texdoc='zathura'
export PDFVIEWER='zathura'

# # Setting for the new UTF-8 terminal support
export LC_CTYPE="en_GB.UTF-8"
export LC_COLLATE="C"
export LC_TIME="C"
export LC_NUMERIC="C"
export LC_MONETARY="C"
export LC_MESSAGES="en_GB.UTF-8"
export LC_ALL=""


eval $(dircolors -b $HOME/.dircolors)
# export LS_COLORS="$(vivid generate snazzy)"

export PATH="$HOME/texlive/2019/bin/x86_64-linux:$PATH"
export MANPATH="$HOME/texlive/2019/texmf-dist/doc/man:$MANPATH"
export INFOPATH="$HOME/texlive/2019/texmf-dist/doc/info:$INFOPATH"

# If not running interactively, don't do anything
case $- in
    *i*) ;;
    *) return;;
esac

# Path to the bash it configuration
export BASH_IT="$HOME/.bash_it"

# shit='bash-it'
# batshit='bash-it'
# bashit='bash-it'
# batbsh='bash-it'
# babsh='bash-it'
# bash_it='bash-it'
# bash_ti='bash-it'

# Lock and Load a custom theme file.
# Leave empty to disable theming.
# location /.bash_it/themes/
export BASH_IT_THEME='zork'
# export BASH_IT_THEME='modern'

# Your place for hosting Git repos. I use this for private repos.
# export GIT_HOSTING='git@git.domain.com'

# Don't check mail when opening terminal.
unset MAILCHECK

# Change this to your console based IRC client of choice.
# export IRC_CLIENT='irssi'

# Set this to the command you use for todo.txt-cli
# export TODO="t"

# Set this to false to turn off version control status checking within the prompt for all themes
export SCM_CHECK=true

# Set Xterm/screen/Tmux title with only a short hostname.
# Uncomment this (or set SHORT_HOSTNAME to something else),
# Will otherwise fall back on $HOSTNAME.
#export SHORT_HOSTNAME=$(hostname -s)

# Set Xterm/screen/Tmux title with shortened command and directory.
# Uncomment this to set.
#export SHORT_TERM_LINE=true

# Load Bash It
source "$BASH_IT"/bash_it.sh
# . $HOME/.ghcup/env
export PATH="$HOME/.cabal/bin:$HOME/.ghcup/bin:$PATH"

# GoLang
export GOROOT=$HOME/.go
export PATH=$PATH:$GOROOT/bin
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin

clear

export SH=/bin/bash
export PATH="$HOME/pkg/sbin:$HOME/pkg/bin:$PATH"
export MANPATH="$HOME/pkg/man:$MANPATH"
export MANPATH="$MANPATH:$HOME/man"
# export PKG_PATH="http://cdn.netbsd.org/pub/pkgsrc/packages/Linux/x86_64/Ubuntu-18.04_head/All/"
# export PKG_PATH="http://pkgsrc.joyent.com/packages/Linux/el7/trunk/x86_64/All/"
export DEAL_II_DIR="$HOME/dealii_candi/deal.II-v9.1.1/"
# export TERM=xterm-256color
export PATH="$PATH:$HOME/Colormake"
alias make='colormake'
# alias gmake='colormake'
alias gcc='COLORMAKE_COMMAND=gcc colormake'
alias clang='COLORMAKE_COMMAND=clang colormake'

# Nodejs
VERSION=v10.16.0
DISTRO=linux-x64
export PATH="$HOME/node-$VERSION-$DISTRO/bin:$PATH"

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
export PATH="$PATH:$HOME/ctags/bin"
export PATH="$PATH:$HOME/remake/bin"

export PATH="/home/krishna/perl5/bin${PATH:+:${PATH}}";
PERL5LIB="/home/krishna/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/home/krishna/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/home/krishna/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/home/krishna/perl5"; export PERL_MM_OPT;

export PATH="$PATH:$HOME/.fzf/bin";

export FZF_DEFAULT_OPTS='--height 40% --layout=reverse --border'
# One-dark colourscheme
# export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS'
# --color=dark
# --color=fg:-1,bg:-1,hl:#c678dd,fg+:#ffffff,bg+:#4b5263,hl+:#d858fe
# --color=info:#98c379,prompt:#61afef,pointer:#be5046,marker:#e5c07b,spinner:#61afef,header:#61afef
# '

export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git' # If you want the command to follow symbolic links, and don't want it to exclude hidden files, use the following command:"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

# Using highlight (http://www.andre-simon.de/doku/highlight/en/highlight.html)
# export FZF_CTRL_T_OPTS="--preview '[[ $(file --mime {}) =~ binary ]] && echo {} is a binary file || (bat --style=numbers --color=always {} || highlight -O ansi -l {} || coderay {} || rougify {} || cat {}) 2> /dev/null | head -500'"
# Try bat, highlight, coderay, rougify in turn, then fall back to cat

# --select-1 automatically selects the item if there's only one so that you don't have to press enter key. Likewise, --exit-0 automatically exits when the list is empty. These options are also useful in FZF_ALT_C_OPTS.
# export FZF_CTRL_T_OPTS=$FZF_DEFAULT_OPTS'
# --select-1 --exit-0
# '

# ALT-C preview The following example uses tree command to show the entries of the directory.
export FZF_ALT_C_OPTS="--preview 'tree -C {} | head -200'"

[ -f $HOME/.fzf.bash ] && source $HOME/.fzf.bash

# for cppman: https://github.com/aitjcize/cppman
# export COMP_WORDBREAKS=" /\"\'><;|&("

export PAGER="bat"

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
